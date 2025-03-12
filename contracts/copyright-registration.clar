;; copyright-registration.clar - Simplified Version

;; Define a map to store creative works and their metadata
(define-map creative-works
  { work-id: uint }
  {
    title: (string-ascii 100),
    description: (string-ascii 500),
    creator: principal,
    owner: principal,
    created-at: uint,
    content-hash: (string-ascii 64)
  }
)

;; Counter for work IDs
(define-data-var work-id-counter uint u0)

;; Error codes
(define-constant err-not-found (err u404))
(define-constant err-unauthorized (err u403))

;; Read-only function to get work details
(define-read-only (get-work-details (work-id uint))
  (map-get? creative-works { work-id: work-id })
)

;; Register a new creative work
(define-public (register-work (title (string-ascii 100)) (description (string-ascii 500)) (content-hash (string-ascii 64)))
  (let
    ((new-id (var-get work-id-counter)))
    (begin
      ;; Increment the work ID counter
      (var-set work-id-counter (+ new-id u1))

      ;; Store the work
      (map-insert creative-works
        { work-id: new-id }
        {
          title: title,
          description: description,
          creator: tx-sender,
          owner: tx-sender,
          created-at: block-height,
          content-hash: content-hash
        }
      )

      ;; Return the new work ID
      (ok new-id)
    )
  )
)

;; Transfer ownership of a work
(define-public (transfer-ownership (work-id uint) (new-owner principal))
  (let
    ((work-opt (map-get? creative-works { work-id: work-id })))
    (begin
      ;; Check if work exists
      (asserts! (is-some work-opt) err-not-found)

      (let
        ((work (unwrap! work-opt err-not-found)))
        (begin
          ;; Check if sender is the current owner
          (asserts! (is-eq (get owner work) tx-sender) err-unauthorized)

          ;; Update ownership
          (map-set creative-works
            { work-id: work-id }
            (merge work { owner: new-owner })
          )

          ;; Return success
          (ok true)
        )
      )
    )
  )
)

