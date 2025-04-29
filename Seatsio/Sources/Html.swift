import Foundation

let HTML = """
            <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <script src="https://cdn-%region%.seatsio.net/chart.js" type="text/javascript"></script>
            </head>
            <body style="margin: 0; padding: 0;">
                <div id="chart" style="width: 100%; height: 100%;"></div>

                <script>
                    let chart = new seatsio.%toolName%(%configAsJs%).render();

                    window.bridge.register("setSpotlightObjects", function(objects) {
                        chart.setSpotlightObjects(objects)
                    });

                    window.bridge.register("setSpotlightOnSelection", function() {
                        chart.setSpotlightOnSelection()
                    });

                    window.bridge.register("clearSpotlightObjects", function() {
                        chart.clearSpotlightObjects()
                    });

                    window.bridge.register("selectObjects", function(objects) {
                        chart.selectObjects(objects)
                    });

                    window.bridge.register("deselectObjects", function(objects) {
                        chart.deselectObjects(objects)
                    });

                    window.bridge.register("selectCategories", function(categories) {
                        chart.selectCategories(categories)
                    });

                    window.bridge.register("deselectCategories", function(categories) {
                        chart.deselectCategories(categories)
                    });

                    window.bridge.register("getHoldToken", function(data, callback) {
                        callback(chart.holdToken)
                    });

                    window.bridge.register("zoomToSelectedObjects", function(data, callback) {
                        chart.zoomToSelectedObjects()
                    });

                    window.bridge.register("zoomToSection", function(label, callback) {
                        chart.zoomToSection(label)
                    });

                    window.bridge.register("rerender", function(data, callback) {
                        chart.rerender()
                    });

                    window.bridge.register("resetView", function(data, callback) {
                        chart.resetView()
                    });

                    window.bridge.register("startNewSession", function(data, callback) {
                        chart.startNewSession()
                    });

                    window.bridge.register("selectBestAvailable", function(data, callback) {
                        chart.selectBestAvailable(JSON.parse(data))
                    });

                    window.bridge.register("listSelectedObjects", function(data, callback) {
                        chart.listSelectedObjects(objects => callback(JSON.stringify(objects)))
                    });

                    window.bridge.register("getReportBySelectability", function(data, callback) {
                        chart.getReportBySelectability(report => callback(JSON.stringify(report)))
                    });

                    window.bridge.register("listCategories", function(data, callback) {
                        chart.listCategories(categories => callback(JSON.stringify(categories)))
                    });

                    window.bridge.register("findObject", function(data, callback) {
                        chart.findObject(data, object => callback(JSON.stringify(object)), () => { callback() })
                    });

                    window.bridge.register("clearSelection", function(data, callback) {
                        chart.clearSelection(() => callback())
                    });

                    window.bridge.register("changeConfig", function(data, callback) {
                        chart.changeConfig(JSON.parse(data))
                    });

                    window.bridge.register("selectObject", function(data, callback) {
                        chart.findObject(data.label).then(object => object.select(data.ticketType === null ? undefined : data.ticketType))
                    });

                    window.bridge.register("deselectObject", function(data, callback) {
                        chart.findObject(data.label).then(object => object.deselect(data.ticketType === null ? undefined : data.ticketType))
                    });

                    window.bridge.register("pulseObject", function(data, callback) {
                        chart.findObject(data).then(object => object.pulse())
                    });

                    window.bridge.register("unpulseObject", function(data, callback) {
                        chart.findObject(data).then(object => object.unpulse())
                    });

                    window.bridge.register("isObjectInChannel", function(data, callback) {
                        chart.findObject(data.label).then(object => callback(object.isInChannel(data.channel)))
                    });

                    window.bridge.register("goToFloor", function(floorName, callback) {
                        chart.goToFloor(floorName)
                    });

                    window.bridge.register("goToAllFloorsView", function(data, callback) {
                        chart.goToAllFloorsView()
                    });

                    window.bridge.register("zoomToObjects", function(data, callback) {
                        chart.zoomToObjects(data)
                    });

                    window.bridge.register("trySelectObjects", function(data, callback) {
                        chart.trySelectObjects(data)
                    });

                    window.bridge.register("doSelectObjects", function(data, callback) {
                        chart.doSelectObjects(data)
                    });

                    window.bridge.register("zoomToFilteredCategories", function(data, callback) {
                        chart.zoomToFilteredCategories()
                    });
                </script>
            </body>
            </html>
            """
