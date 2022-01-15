from std/times import DateTime
import std/json

type
    Prodigi = object
        id: string          ## X-Pwinty-MerchantId
        api_key: string     ## X-Pwinty-REST-API-Key
        sandbox: bool       ## Whether it should run through sandbox for development and testing purposes.
    
    # Object used to hold shippment details provided by Prodigi
    # Note that all these fields are read-only.
    Shippment = object
        id: string                  ## Unique ID for this shipment
        carrier: string             ## Carrier for this shipment
        tracking: string            ## Tracking information for this shipment. Only be set if an shipment can be tracked
        dispatchDate: DateTime      ## When the lab despatched this shipment

    # Your requested shipping method: either Budget, Standard, Express or Overnight.
    # See shipping for more information about these methods,
    # and how they map to real-world couriers.
    # https://www.prodigi.com/print-api/docs/reference/#the-order-process-7-shipping
    ShippingMethod* = enum
        Budget, Standard, Express, Overnight

    # Recipient object containing name, email, phone number and address field.
    # Note that: While recipient email and phoneNumber are technically optional,
    # it's highly recommended you include these if you have international orders as
    # they aid couriers with customs issues. For example, contact information is a
    # requirement for any item shipped from the UK post-Brexit.
    # We will substitute with default dummy information if not provided to ensure
    # courier systems accept the order, but relying on this is not advisable.
    Recipient* = object
        name*: string               ## Recipient's name. Long name may be truncated to suit courier guidelines (required)
        email*: string              ## Recipient's email address (optional)
        phoneNumber*: string        ## Recipient's mobile phone number (optional)
        address*: RecipientAddress  ## Recipient's address. (required)

    RecipientAddress = object
        line1: string               ## First line of Recipient's address (required)
        line2: string               ## Second line address (optional)
        postalOrZipCode: string     ## Postcode or zip code of recipient's address. (required)
        countryCode: string         ## Two-letter ISO country code of recipient's address. (required)
        townOrCity: string          ## Town or city of recipient's address. (required)
        stateOrCountry: string      ## State or county for the recipient's address. (optional)


    # The Order object contains all the information
    # you need to manage your order. Once created, most of the order remains static,
    # while areas like Status and Shipments change as the order progresses.
    # For more informations check:
    # https://www.prodigi.com/print-api/docs/reference/#order-object
    Order* = object
        id: string                          ## Read-only field set by Prodigi
        status: OrderStatus                 ## Read-only field set by Prodigi
        created: string
        charges: Charge                     ## Charges for this order. Set by Prodigi
        shipments: Shippment                ## Courier and service shipment details per item, if available. Set by Prodigi.
        recipient: Recipient
        items: openarray[string]            ## Items to be fulfilled. Products + assets. (required)
        callbackUrl*: string                ## Your callback URL, where will send callback events. (optional | recommended)
        merchantReference: string           ## Your own reference ID for this order.
        shippingMethod: ShippingMethod      ## Your requested shipping method: either Budget, Standard, Express or Overnight (required)
        idempotencyKey*: string             ## Your personal idempotency key. https://www.prodigi.com/print-api/docs/reference/#order-object-idempotency-key
        packingSlip: PackingSlip            ## Packing slip (optional)
        metadata: JsonNode                  ## A custom JSON object containing keys and values of your choice. Up to 2000 characters.

    # Each order object provided by the API has an associated Status object
    # that provides a rich description of the order's
    # fulfilment process and its current stage.
    OrderStatus = object
        stage: string
        details: OrderDetails
        issues: OrderIssues

    # The Details object lists the stages the order goes through
    # during processing, and the status of the order within each of these stages.
    # https://www.prodigi.com/print-api/docs/reference/#status-status-object
    OrderDetails = object
        downloadAssets: string                  ## Download of the image assets from your source URLs to Prodigi.
        allocateProductionLocation: string      ## Allocation of the order items to the most appropriate lab(s).
        printReadyAssetsPrepared: string        ## Transformation of an asset into a print-ready file for submission to the lab(s).
        inProduction: string                    ## Submission to the lab(s).
        shipping: string                        ## Despatch of the item to the customer

    OrderIssues = object
        objectId: string                        ## The object that is in error. This could refer to the order itself (an ID prefixed with ord_) or one of the order items (prefixed with ori_).
        errorCode: string                       ## A code that indicates the type the error:
        description: string                     ## A human-readable description of the error.
        authorisationDetails: OrderAuthorizationDetails      ## If an order requires payment authorization details are provided here.

    OrderAuthorizationDetails = object
        authorisationUrl: string
        paymentDetails: 

    OrderPaymentDetails = object
        amount: float
        currency: string

    # There are 4 actions you can take against an order:
    # Cancel, Update shipping method, Update recipient details, Update metadata
    # Depending on where the order is during the fulfillment process,
    # one or more of these actions may be unavailable.
    OrderActions = object
        discard

proc add*(x, y: int): int =
    ## Adds two files together.
    return x + y
