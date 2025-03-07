#' OpenAPI Petstore
#'
#' This is a sample server Petstore server. For this sample, you can use the api key `special-key` to test the authorization filters.
#'
#' The version of the OpenAPI document: 1.0.0
#' Generated by: https://openapi-generator.tech
#'

#' ApiClient Class
#'
#' Generic API client for OpenAPI client library builds.
#' OpenAPI generic API client. This client handles the client-
#' server communication, and is invariant across implementations. Specifics of
#' the methods and models for each application are generated from the OpenAPI Generator
#' templates.
#'
#' NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
#' Ref: https://openapi-generator.tech
#' Do not edit the class manually.
#'
#' @docType class
#' @title ApiClient
#' @description ApiClient Class
#' @format An \code{R6Class} generator object
#' @field base_path Base url
#' @field user_agent Default user agent
#' @field default_headers Default headers
#' @field username Username for HTTP basic authentication
#' @field password Password for HTTP basic authentication
#' @field api_keys API keys
#' @field access_token Access token
#' @field bearer_token Bearer token
#' @field timeout Default timeout in seconds
#' @field retry_status_codes vector of status codes to retry
#' @field max_retry_attempts maximum number of retries for the status codes
#' @importFrom httr add_headers accept timeout content
#' @importFrom rlang abort
#' @export
ApiClient  <- R6::R6Class(
  "ApiClient",
  public = list(
    # base path of all requests
    base_path = "http://petstore.swagger.io/v2",
    # user agent in the HTTP request
    user_agent = "PetstoreAgent",
    # default headers in the HTTP request
    default_headers = NULL,
    # username (HTTP basic authentication)
    username = NULL,
    # password (HTTP basic authentication)
    password = NULL,
    # API keys
    api_keys = NULL,
    # Access token
    access_token = NULL,
    # Bearer token
    bearer_token = NULL,
    # Time Out (seconds)
    timeout = NULL,
    # Vector of status codes to retry
    retry_status_codes = NULL,
    # Maximum number of retry attempts for the retry status codes
    max_retry_attempts = NULL,
    #' Initialize a new ApiClient.
    #'
    #' @description
    #' Initialize a new ApiClient.
    #'
    #' @param base_path Base path.
    #' @param user_agent User agent.
    #' @param default_headers Default headers.
    #' @param username User name.
    #' @param password Password.
    #' @param api_keys API keys.
    #' @param access_token Access token.
    #' @param bearer_token Bearer token.
    #' @param timeout Timeout.
    #' @param retry_status_codes Status codes for retry.
    #' @param max_retry_attempts Maxmium number of retry.
    #' @export
    initialize = function(base_path = NULL, user_agent = NULL,
                          default_headers = NULL,
                          username = NULL, password = NULL, api_keys = NULL,
                          access_token = NULL, bearer_token = NULL, timeout = NULL,
                          retry_status_codes = NULL, max_retry_attempts = NULL) {
      if (!is.null(base_path)) {
        self$base_path <- base_path
      }

      if (!is.null(default_headers)) {
        self$default_headers <- default_headers
      }

      if (!is.null(username)) {
        self$username <- username
      }

      if (!is.null(password)) {
        self$password <- password
      }

      if (!is.null(access_token)) {
        self$access_token <- access_token
      }

      if (!is.null(bearer_token)) {
        self$bearer_token <- bearer_token
      }

      if (!is.null(api_keys)) {
        self$api_keys <- api_keys
      } else {
        self$api_keys <- list()
      }

      if (!is.null(user_agent)) {
        self$`user_agent` <- user_agent
      }

      if (!is.null(timeout)) {
        self$timeout <- timeout
      }

      if (!is.null(retry_status_codes)) {
        self$retry_status_codes <- retry_status_codes
      }

      if (!is.null(max_retry_attempts)) {
        self$max_retry_attempts <- max_retry_attempts
      }
    },
    #' Prepare to make an API call with the retry logic.
    #'
    #' @description
    #' Prepare to make an API call with the retry logic.
    #'
    #' @param url URL.
    #' @param method HTTP method.
    #' @param query_params The query parameters.
    #' @param header_params The header parameters.
    #' @param body The HTTP request body.
    #' @param stream_callback Callback function to process the data stream
    #' @param ... Other optional arguments.
    #' @return HTTP response
    #' @export
    CallApi = function(url, method, query_params, header_params, body, stream_callback = NULL, ...) {

      resp <- self$Execute(url, method, query_params, header_params, body, stream_callback = stream_callback, ...)
      status_code <- httr::status_code(resp)

      if (is.null(self$max_retry_attempts)) {
        self$max_retry_attempts <- 3
      }

      if (!is.null(self$retry_status_codes)) {

        for (i in 1 : self$max_retry_attempts) {
          if (status_code %in% self$retry_status_codes) {
            Sys.sleep((2 ^ i) + stats::runif(n = 1, min = 0, max = 1))
            resp <- self$Execute(url, method, query_params, header_params, body, stream_callback = stream_callback, ...)
            status_code <- httr::status_code(resp)
          } else {
            break
          }
        }
      }

      resp
    },
    #' Make an API call
    #'
    #' @description
    #' Make an API call
    #'
    #' @param url URL.
    #' @param method HTTP method.
    #' @param query_params The query parameters.
    #' @param header_params The header parameters.
    #' @param body The HTTP request body.
    #' @param stream_callback Callback function to process data stream
    #' @param ... Other optional arguments.
    #' @return HTTP response
    #' @export
    Execute = function(url, method, query_params, header_params, body, stream_callback = NULL, ...) {
      headers <- httr::add_headers(c(header_params, self$default_headers))

      http_timeout <- NULL
      if (!is.null(self$timeout)) {
        http_timeout <- httr::timeout(self$timeout)
      }

      if (method == "GET") {
        if (typeof(stream_callback) == "closure") {
          httr::GET(url, query = query_params, headers, http_timeout,
                    httr::user_agent(self$`user_agent`), write_stream(stream_callback), ...)
        } else {
          httr::GET(url, query = query_params, headers, http_timeout,
                    httr::user_agent(self$`user_agent`), ...)
        }
      } else if (method == "POST") {
        if (typeof(stream_callback) == "closure") {
          httr::POST(url, query = query_params, headers, body = body,
                     httr::content_type("application/json"), http_timeout,
                     httr::user_agent(self$`user_agent`), write_stream(stream_callback), ...)
        } else {
          httr::POST(url, query = query_params, headers, body = body,
                     httr::content_type("application/json"), http_timeout,
                     httr::user_agent(self$`user_agent`), ...)
        }
      } else if (method == "PUT") {
        if (typeof(stream_callback) == "closure") {
          httr::PUT(url, query = query_params, headers, body = body,
                    httr::content_type("application/json"), http_timeout,
                    http_timeout, httr::user_agent(self$`user_agent`), write_stream(stream_callback), ...)
        } else {
          httr::PUT(url, query = query_params, headers, body = body,
                    httr::content_type("application/json"), http_timeout,
                    http_timeout, httr::user_agent(self$`user_agent`), ...)
        }
      } else if (method == "PATCH") {
        if (typeof(stream_callback) == "closure") {
          httr::PATCH(url, query = query_params, headers, body = body,
                      httr::content_type("application/json"), http_timeout,
                      http_timeout, httr::user_agent(self$`user_agent`), write_stream(stream_callback), ...)
        } else {
          httr::PATCH(url, query = query_params, headers, body = body,
                      httr::content_type("application/json"), http_timeout,
                      http_timeout, httr::user_agent(self$`user_agent`), ...)
        }
      } else if (method == "HEAD") {
        if (typeof(stream_callback) == "closure") {
          httr::HEAD(url, query = query_params, headers, http_timeout,
                     http_timeout, httr::user_agent(self$`user_agent`), write_stream(stream_callback), ...)
        } else {
          httr::HEAD(url, query = query_params, headers, http_timeout,
                     http_timeout, httr::user_agent(self$`user_agent`), ...)
        }
      } else if (method == "DELETE") {
        if (typeof(stream_callback) == "closure") {
          httr::DELETE(url, query = query_params, headers, http_timeout,
                       http_timeout, httr::user_agent(self$`user_agent`), write_stream(stream_callback), ...)
        } else {
          httr::DELETE(url, query = query_params, headers, http_timeout,
                       http_timeout, httr::user_agent(self$`user_agent`), ...)
        }
      } else {
        err_msg <- "Http method must be `GET`, `HEAD`, `OPTIONS`, `POST`, `PATCH`, `PUT` or `DELETE`."
        rlang::abort(message = err_msg,
                     .subclass = "ApiException",
                     ApiException = ApiException$new(status = 0, reason = err_msg))
      }
    },
    #' Deserialize the content of api response to the given type.
    #'
    #' @description
    #' Deserialize the content of api response to the given type.
    #'
    #' @param resp Response object.
    #' @param return_type R return type.
    #' @param pkg_env Package environment.
    #' @return Deserialized object.
    #' @export
    deserialize = function(resp, return_type, pkg_env) {
      resp_obj <- jsonlite::fromJSON(httr::content(resp, "text", encoding = "UTF-8"))
      self$deserializeObj(resp_obj, return_type, pkg_env)
    },

    #' Deserialize the response from jsonlite object based on the given type
    #'
    #' @description
    #' Deserialize the response from jsonlite object based on the given type
    #' by handling complex and nested types by iterating recursively
    #' Example return_types will be like "array[integer]", "map(Pet)", "array[map(Tag)]", etc.,
    #'
    #' @param obj Response object.
    #' @param return_type R return type.
    #' @param pkg_env Package environment.
    #' @return Deserialized object.
    #' @export
    deserializeObj = function(obj, return_type, pkg_env) {
      return_obj <- NULL
      primitive_types <- c("character", "numeric", "integer", "logical", "complex")

      # To handle the "map" type
      if (startsWith(return_type, "map(")) {
        inner_return_type <- regmatches(return_type,
                                        regexec(pattern = "map\\((.*)\\)", return_type))[[1]][2]
        return_obj <- lapply(names(obj), function(name) {
          self$deserializeObj(obj[[name]], inner_return_type, pkg_env)
        })
        names(return_obj) <- names(obj)
      } else if (startsWith(return_type, "array[")) {
        # To handle the "array" type
        inner_return_type <- regmatches(return_type,
                                        regexec(pattern = "array\\[(.*)\\]", return_type))[[1]][2]
        if (c(inner_return_type) %in% primitive_types) {
          return_obj <- vector("list", length = length(obj))
          if (length(obj) > 0) {
            for (row in 1:length(obj)) {
              return_obj[[row]] <- self$deserializeObj(obj[row], inner_return_type, pkg_env)
            }
          }
        } else {
          if (!is.null(nrow(obj))) {
            return_obj <- vector("list", length = nrow(obj))
            if (nrow(obj) > 0) {
              for (row in 1:nrow(obj)) {
                return_obj[[row]] <- self$deserializeObj(obj[row, , drop = FALSE],
                                                         inner_return_type, pkg_env)
              }
            }
          }
        }
      } else if (exists(return_type, pkg_env) && !(c(return_type) %in% primitive_types)) {
        # To handle model objects which are not array or map containers. Ex:"Pet"
        return_type <- get(return_type, envir = as.environment(pkg_env))
        return_obj <- return_type$new()
        return_obj$fromJSON(
          jsonlite::toJSON(obj, digits = NA, auto_unbox = TRUE)
        )
      } else {
        # To handle primitive type
        return_obj <- obj
      }
      return_obj
    }
  )
)
