;
;
(function() {
        if (window.bridge) {
                return;
        }
        window.bridge = function() {
                var handlers = {},
                    callbacks = {},
            errorCallbacks = {},
                        jsCallbackId = 0;

                function postMessage(name, data, swiftCallbackId, jsCallbackId, error) {
                        if (window.webkit && window.webkit.messageHandlers && window.webkit.messageHandlers.bridge) {
                                window.webkit.messageHandlers.bridge.postMessage({
                                        "name": name,
                                        "data": data,
                                        "swiftCallbackId": swiftCallbackId,
                                        "jsCallbackId": jsCallbackId,
                                        "error": error,
                                });
                        }
                }

                return {
                        "register": function(name, handler) {
                                handlers[name] = handler;
                        },
                        "call": function(name, data, callback, errorCallback) {
                                var id = (jsCallbackId++).toString();
                                callbacks[id] = callback;
                errorCallbacks[id] = errorCallback;
                postMessage(name, data, null, id, null);
                        },
                        "receiveMessage": function(message) {
                                var name = message.name;
                                var data = message.data;
                                var jsCallbackId = message.jsCallbackId;
                                var swiftCallbackId = message.swiftCallbackId;
                var error = message.error;

                                if (jsCallbackId) {
                                        if(error) {
                                                var jsErrorCallback = errorCallbacks[jsCallbackId];
                                                if (jsErrorCallback) {
                                                        jsErrorCallback(error);
                                                        delete errorCallbacks[jsCallbackId];
                                                }
                                        } else {
                                                var jsCallback = callbacks[jsCallbackId];
                                                if (jsCallback) {
                                                        jsCallback(data);
"bridge.js" 75L, 1895B
