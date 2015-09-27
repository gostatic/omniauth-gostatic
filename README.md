# OmniAuth GoStatic

This is the official OmniAuth strategy for authenticating to GoStatic. To
use it, you'll need to sign up for an OAuth2 Application ID and Secret
which is currently only available upon request.



## Basic Usage

Add the following code to your OmniAuth intialization process:

``` ruby
use OmniAuth::Builder do
  provider :gostatic, ENV['GOSTATIC_KEY'], ENV['GOSTATIC_SECRET']
end
```


## GoStatic Enterprise Usage

``` ruby
use OmniAuth::Builder do
  provider :gostatic, ENV['GOSTATIC_KEY'], ENV['GOSTATIC_SECRET'],
    {
      client_options: {
        site: 'https://gostatic.YOURDOMAIN.com/api/v1',
        authorize_url: 'https://gostatic.YOURDOMAIN.com/oauth/authorize',
        token_url: 'https://gostatic.YOURDOMAIN.com/oauth/token',
      }
    }
end
```
