# Looker API 3.0 Reference
# 
# ### Authorization  The Looker API uses Looker **API3** credentials for authorization and access control. Looker admins can create API3 credentials on Looker's **Admin/Users** page. Pass API3 credentials to the **/login** endpoint to obtain a temporary access_token. Include that access_token in the Authorization header of Looker API requests. For details, see [Looker API Authorization](https://looker.com/docs/r/api/authorization)  ### Client SDKs  The Looker API is a RESTful system that should be usable by any programming language capable of making HTTPS requests. Client SDKs for a variety of programming languages can be generated from the Looker API's Swagger JSON metadata to streamline use of the Looker API in your applications. A client SDK for Ruby is available as an example. For more information, see [Looker API Client SDKs](https://looker.com/docs/r/api/client_sdks)  ### Try It Out!  The 'api-docs' page served by the Looker instance includes 'Try It Out!' buttons for each API method. After logging in with API3 credentials, you can use the \"Try It Out!\" buttons to call the API directly from the documentation page to interactively explore API features and responses.  ### Versioning  Future releases of Looker will expand this API release-by-release to securely expose more and more of the core power of Looker to API client applications. API endpoints marked as \"beta\" may receive breaking changes without warning. Stable (non-beta) API endpoints should not receive breaking changes in future releases. For more information, see [Looker API Versioning](https://looker.com/docs/r/api/versioning) 
# 
# OpenAPI spec version: 3.0.0
# 
# Generated by: https://github.com/swagger-api/swagger-codegen.git


#' LDAPUserAttributeRead Class
#'
#' @field name 
#' @field required 
#' @field user_attributes 
#' @field url 
#' @field can 
#'
#' @importFrom R6 R6Class
#' @importFrom jsonlite fromJSON toJSON
#' @export
LDAPUserAttributeRead <- R6::R6Class(
  'LDAPUserAttributeRead',
  public = list(
    `name` = NULL,
    `required` = NULL,
    `user_attributes` = NULL,
    `url` = NULL,
    `can` = NULL,
    initialize = function(`name`, `required`, `user_attributes`, `url`, `can`){
      if (!missing(`name`)) {
        stopifnot(is.character(`name`), length(`name`) == 1)
        self$`name` <- `name`
      }
      if (!missing(`required`)) {
        self$`required` <- `required`
      }
      if (!missing(`user_attributes`)) {
        stopifnot(is.list(`user_attributes`), length(`user_attributes`) != 0)
        lapply(`user_attributes`, function(x) stopifnot(R6::is.R6(x)))
        self$`user_attributes` <- `user_attributes`
      }
      if (!missing(`url`)) {
        stopifnot(is.character(`url`), length(`url`) == 1)
        self$`url` <- `url`
      }
      if (!missing(`can`)) {
        self$`can` <- `can`
      }
    },
    toJSON = function() {
      LDAPUserAttributeReadObject <- list()
      if (!is.null(self$`name`)) {
        LDAPUserAttributeReadObject[['name']] <- self$`name`
      }
      if (!is.null(self$`required`)) {
        LDAPUserAttributeReadObject[['required']] <- self$`required`
      }
      if (!is.null(self$`user_attributes`)) {
        LDAPUserAttributeReadObject[['user_attributes']] <- lapply(self$`user_attributes`, function(x) x$toJSON())
      }
      if (!is.null(self$`url`)) {
        LDAPUserAttributeReadObject[['url']] <- self$`url`
      }
      if (!is.null(self$`can`)) {
        LDAPUserAttributeReadObject[['can']] <- self$`can`
      }

      LDAPUserAttributeReadObject
    },
    fromJSON = function(LDAPUserAttributeReadJson) {
      LDAPUserAttributeReadObject <- jsonlite::fromJSON(LDAPUserAttributeReadJson)
      if (!is.null(LDAPUserAttributeReadObject$`name`)) {
        self$`name` <- LDAPUserAttributeReadObject$`name`
      }
      if (!is.null(LDAPUserAttributeReadObject$`required`)) {
        self$`required` <- LDAPUserAttributeReadObject$`required`
      }
      if (!is.null(LDAPUserAttributeReadObject$`user_attributes`)) {
        self$`user_attributes` <- lapply(LDAPUserAttributeReadObject$`user_attributes`, function(x) {
          user_attributesObject <- UserAttribute$new()
          user_attributesObject$fromJSON(jsonlite::toJSON(x, auto_unbox = TRUE))
          user_attributesObject
        })
      }
      if (!is.null(LDAPUserAttributeReadObject$`url`)) {
        self$`url` <- LDAPUserAttributeReadObject$`url`
      }
      if (!is.null(LDAPUserAttributeReadObject$`can`)) {
        self$`can` <- LDAPUserAttributeReadObject$`can`
      }
    },
    toJSONString = function() {
       sprintf(
        '{
           "name": %s,
           "required": %s,
           "user_attributes": [%s],
           "url": %s,
           "can": %s
        }',
        self$`name`,
        self$`required`,
        lapply(self$`user_attributes`, function(x) paste(x$toJSON(), sep=",")),
        self$`url`,
        self$`can`
      )
    },
    fromJSONString = function(LDAPUserAttributeReadJson) {
      LDAPUserAttributeReadObject <- jsonlite::fromJSON(LDAPUserAttributeReadJson)
      self$`name` <- LDAPUserAttributeReadObject$`name`
      self$`required` <- LDAPUserAttributeReadObject$`required`
      self$`user_attributes` <- lapply(LDAPUserAttributeReadObject$`user_attributes`, function(x) UserAttribute$new()$fromJSON(jsonlite::toJSON(x, auto_unbox = TRUE)))
      self$`url` <- LDAPUserAttributeReadObject$`url`
      self$`can` <- LDAPUserAttributeReadObject$`can`
    }
  )
)
