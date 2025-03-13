#!/usr/bin/env zx

/*
* Script to release the seats.io ios lib.
*   - changes the version number in README.md
*   - changes the version number in build.gradle
*   - creates the release in Gihub (using gh cli)
*
*
* Prerequisites:
*   - zx installed (https://github.com/google/zx)
*   - gh cli installed (https://cli.github.com/)
*
* Usage:
*   yarn zx ./release.mjs -v major/minor -n "release notes"
* */

// don't output the commands themselves
$.verbose = false

const semver = require('semver')
const versionToBump = getVersionToBump()
const latestVersion = await fetchLatestReleasedVersionNumber()
const nextVersion = await determineNextVersionNumber(latestVersion)

await pullLastVersion()
    .then(bumpVersionInFiles)
    .then(commitAndPush)
    .then(release)

function getVersionToBump() {
    if (!argv.v || !(argv.v === 'minor' || argv.v === 'major')) {
        throw new Error ("Please specify -v major/minor")
    }
    return argv.v
}

async function fetchLatestReleasedVersionNumber() {
    let result = await $`gh release view --json tagName`
    return JSON.parse(result).tagName
}

async function determineNextVersionNumber(previous) {
    return semver.inc(previous, versionToBump)
}

async function bumpVersionInFiles() {
    await replaceInFile("seatsio.podspec", `= '${latestVersion}'`, `= '${nextVersion}'`)
    await replaceInFile("README.md", latestVersion, nextVersion)
}

async function replaceInFile(filename, latestVersion, nextVersion) {
    return await fs.readFile(filename, 'utf8')
        .then(text => {
            if (text.indexOf(latestVersion) < 0) {
                throw new Error('Not the correct version. Could not find ' + latestVersion + ' in ' + filename)
            }
            return text
        })
        .then(text => text.replaceAll(latestVersion, nextVersion))
        .then(text => fs.writeFileSync(filename, text))
        .then(() => gitAdd(filename))
}

async function pullLastVersion() {
    await $`git checkout master`
    await $`git pull origin master`
}

async function gitAdd(filename) {
    return await $`git add ${filename}`
}

async function commitAndPush() {
    await $`git commit -m "version bump"`
    await $`git push origin master`
}

async function release() {
    return await $`gh release create ${nextVersion} --generate-notes`.catch(error => {
        console.error('something went wrong while creating the release. Please revert the version change!')
        throw error
    })
}
