# Subscription Service

A microservice that receives new registration and sends subscription email according to the new registration Marketing selections.

When someone registers, they select whether they want to subscribe to marketing emails.
This service sends subscription email after successful registration to the newly registered users as a confirmation of them subscribed to marketing emails

### Build

```bash
gem build subscription-service.gemspec
```
