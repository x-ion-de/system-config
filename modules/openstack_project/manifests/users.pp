# == Class: openstack_project::users
#
class openstack_project::users {
  # Make sure we have our UID/GID account minimums for dynamic users set higher
  # than we'll use for static assignments, so as to avoid future conflicts.
  include openstack_project::params
  file { '/etc/login.defs':
    ensure => present,
    group  => 'root',
    mode   => '0644',
    owner  => 'root',
    source => $::openstack_project::params::login_defs,
  }
  User::Virtual::Localuser {
    require => File['/etc/login.defs']
  }

  @user::virtual::localuser { 'mordred':
    realname => 'Monty Taylor',
    sshkeys  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDLsTZJ8hXTmzjKxYh/7V07mIy8xl2HL+9BaUlt6A6TMsL3LSvaVQNSgmXX5g0XfPWSCKmkZb1O28q49jQI2n7n7+sHkxn0dJDxj1N2oNrzNY7pDuPrdtCijczLFdievygXNhXNkQ2WIqHXDquN/jfLLJ9L0jxtxtsUMbiL2xxZEZcaf/K5MqyPhscpqiVNE1MjE4xgPbIbv8gCKtPpYIIrktOMb4JbV7rhOp5DcSP5gXtLhOF5fbBpZ+szqrTVUcBX0oTYr3iRfOje9WPsTZIk9vBfBtF416mCNxMSRc7KhSW727AnUu85hS0xiP0MRAf69KemG1OE1pW+LtDIAEYp',
    key_id   => 'mordred@camelot',
    uid      => 2000,
    gid      => 2000,
  }

  @user::virtual::localuser { 'corvus':
    realname => 'James E. Blair',
    sshkeys  => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAvKYcWK1T7e3PKSFiqb03EYktnoxVASpPoq2rJw2JvhsP0JfS+lKrPzpUQv7L4JCuQMsPNtZ8LnwVEft39k58Kh8XMebSfaqPYAZS5zCNvQUQIhP9myOevBZf4CDeG+gmssqRFcWEwIllfDuIzKBQGVbomR+Y5QuW0HczIbkoOYI6iyf2jB6xg+bmzR2HViofNrSa62CYmHS6dO04Z95J27w6jGWpEOTBjEQvnb9sdBc4EzaBVmxCpa2EilB1u0th7/DvuH0yP4T+X8G8UjW1gZCTOVw06fqlBCST4KjdWw1F/AuOCT7048klbf4H+mCTaEcPzzu3Fkv8ckMWtS/Z9Q==',
    key_id   => 'jeblair@operational-necessity',
    uid      => 2001,
    gid      => 2001,
  }

  @user::virtual::localuser { 'smaffulli':
    realname => 'Stefano Maffulli',
    sshkeys  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDD/zAvXaOUXCAT6/B4sCMu/38d/PyOIg/tYsYFAMgfDUzuZwkjZWNGrTpp/HFrOAZISER5KmOg48DKPvm91AeZOHfAXHCP6x9/FcogP9rmc48ym1B5XyIc78QVQjgN6JMSlEZsl0GWzFhQsPDjXundflY07TZfSC1IhpG9UgzamEVFcRjmNztnBuvq2uYVGpdI+ghmqFw9kfvSXJvUbj/F7Pco5XyJBx2e+gofe+X/UNee75xgoU/FyE2a6dSSc4uP4oUBvxDNU3gIsUKrSCmV8NuVQvMB8C9gXYR+JqtcvUSS9DdUAA8StP65woVsvuU+lqb+HVAe71JotDfOBd6f',
    key_id   => 'stefano@mattone-E6420',
    uid      => 2002,
    gid      => 2002,
  }

  @user::virtual::localuser { 'clarkb':
    realname => 'Clark Boylan',
    sshkeys  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDlH6SNieyGDWNl4b9TM+zUgk+XTXRtqxyYxNh1p5e00u/ZrZPVrc7buPhnTHzEde0ABX0vgnZI2rC5Hf9cYY0aRgLHDuikQ4CQHPucslgZ5linjtWx5AuURp+oaJRCj00UZubJsatUx5vz+D4MGRLYmL+MErftYdI4sBbolATfLVwjrmxsd6KF1BZ0+9eEv2Xrk+yXN1A5RGPKBiuE6viDMZxrOuy7IW8+TQZW1LrsbTCAD1b+J5Nx0z/Hn3Rz71zEibdwM9xgu5vROu3p9kdaxu+Ndg/SvCCWlzoLQSeIAmcfGUlWg9IjEc3sQexX9BmUAsKQtu3aZFgq2V7aqtDN',
    key_id   => 'boylandcl@boylancl1',
    uid      => 2005,
    gid      => 2005,
  }

  @user::virtual::localuser { 'fungi':
    realname => 'Jeremy Stanley',
    sshkeys  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQD3KnRBTH5QPpKjf4RWu4akzYt2gwp796cMkFl5vu8e7G/cHuh4979FeNJXMVP6F3rvZB+yXDHLCU5LBVLq0K+1GbAZT/hH38hpMOIvniwKIquvI6C/drkVPHO6YmVlapw/NI530PGnT/TAqCOycHBO5eF1bYsaqV1yZqvs9v7UZc6J4LukoLZwpmyWZ5P3ltAiiy8+FGq3SLCKWDMmv/Bjz4zTsaNbSWThJi0BydINjC1/0ze5Tyc/XgW1sDuxmmXJxgQp4EvLpronqb2hT60iA52kj8lrmoCIryRpgnbaRA7BrxKF8zIr0ZALHijxEUeWHhFJDIVRGUf0Ef0nrmBv',
    key_id   => 'fungi-openstack-2015',
    uid      => 2007,
    gid      => 2007,
  }

  @user::virtual::localuser { 'ttx':
    realname => 'Thierry Carrez',
    sshkeys  => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDCGpMtSehQNZL0/EJ7VUbklJygsxvii2Qi4HPSUFcLJUWAx4VltsmPkmx43D9ITwnRPRMPNtZrOvhY7v0myVlFuRnyTYAqZwigf5gxrktb+4PwCWb+2XobziUVnfJlbOTjneWSTYoZ+OjTaWd5AcVbUvgYAP2qbddycc5ACswpPDo5VrS6fQfCwE4z3BqLFNeOnqxbECHwHeFYIR6Kd6mnKAzDNZxZIkviWg9eIwwuFf5V5bUPiVkeFHVL3EJlCoYs2Em4bvYZBtrV7kUseN85X/+5Uail4uYBEcB3GLL32e6HeD1Qk4xIxLTI2bFPGUp0Oq7iPgrQQe4zCBsGi7Dx+JVy+U0JqLLAN94UPCn2fhsX7PdKfTPcxFPFKeX/PRutkb7qxdbS2ubCdOEhc6WN7OkQmbdK8lk6ms4v4dFc0ooMepWELqKC6thICsVdizpuij0+h8c4SRD3gtwGDPxrkJcodPoAimVVlW1p+RpMxsCFrK473TzgeNPVeAdSZVpqZ865VOwFqoFQB6WpmCDZQPFlkS2VDe9R54ePDHWKYLvVW6yvQqWTx3KrIrS1twSoydj+gADgBYsZaW5MNkWYHAWotEX67j6fMZ6ZSTS5yaTeLywB2Ykh0kjo4jpTFk5JNL7DINkfmCEZMLw60da29iN4QzAJr9cP1bwjf/QDqw==',
    key_id   => 'ttx@mercury',
    uid      => 2008,
    gid      => 2008,
  }

  @user::virtual::localuser { 'rbryant':
    realname => 'Russell Bryant',
    sshkeys  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDZVikFz5KoRg3gKdiSa3PQ0i2bN5+bUyc4lMMg6P+jEStVddwN+nAgpa3zJaokmNAOp+MjcGa7K1Zi4b9Fe2ufusTzSKdNVlRDiw0R4Lk0LwTIfkhLywKvgcAz8hkqWPUIgTMU4xIizh50KTL9Ttsu9ULop8t7urTpPE4TthHX4nz1Y9NwYLU0W8cWhzgRonBbqtGs/Lif0NC+TdWGkVyTaP3x1A48s0SMPcZKln1hDv7KbKdknG4XyS4jlr4qI+R+har7m2ED/PH93PSXi5QnT4U6laWRg03HTxpPKWq077u/tPW9wcbkgpBcYMmDKTo/NDPtoN+r/jkbdW7zKJHx',
    key_id   => 'russel@russelbryant.net',
    uid      => 2009,
    gid      => 2009,
  }

  @user::virtual::localuser { 'pabelanger':
    realname => 'Paul Belanger',
    sshkeys  => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDIdkI92kJyePsy8MSCgH9VcG5FBdHg+mX8jUniGnxzp2BJ9O+ZVUQLgDIneK/NIoTIs1WIRy5yTuSpqKuX/fZCXdLCfHdHlmNLw5/iF98X9h+c1E5/ZtEuZrfQstP5EHdLxTKD+AEvBSTin9Ptorn+tI1tQf/9hC4flJzOmiFrvhGKhmVd9DToZqMPy2JviajiVu9e/OXdPIcV2hlsm/Db03/zc9Ohkbw6oST/w+ZslvUMCvFUKPAlYG7db4TN+RfWfeWEd3u82beO320zqCPiEHmn2wYAppSXQ+f6beFL6FwejFYgH8F7hEfNyN2Z3V1eR73uSnxfYTGHqgJNAN2Vbl3EmNEhQ60gwuKTXlMpQf5Wny2nJGz7zYCReDbgQH/Zoejw3+Nfk4PcTZtso5Bjti1s+ChGNu3qpS6d7gkEYqcKRtA9If0tP5X5LqUqZw+66BKTBUiXGeip9XCeStN00OdFBcQJZ3h/8xIZsKmkpnBK9uB6NRrFAcxTj9SmpYMUjFOt1nI/b36vCnrcHinSIpWpYAxuySoca5CIJaisQVzG/DzYp801tjCSViKQ0kfMH0cBw0MZOEPYy+itkvDa6chq+gFfmChNJdI4oSqDId8ID60G8eZPDcIKFQAW5kAmdtss11kdwWmszi6KTjdCmbYABfPnt8UGud3WLn5Mew==',
    key_id   => 'pabelanger@redhat.com',
    uid      => 2010,
    gid      => 2010,
  }

  @user::virtual::localuser { 'elizabeth':
    realname => 'Elizabeth K. Joseph',
    sshkeys  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDL9x1rhTVOEQEanrN+ecycaDtAbbh3kr41Rxx7galtLq0JwftjsZqv2Vwl9c8ARmm8HiHcLwDoaZB9gvs6teMScCB+5a1fcohiycJBl2olNFRzkGapDaTvl74aLXQBWaV84D8tUavEl26zcgwrv9WLUsy9pnHoo5K0BzbK7vT2g3VictCphveC2vdjCDeptocWvt4zxCmAY6O7QMKeUjKMlvuy+zCohJcR4BbDnw8EriFAmCeQZcAgfLTyeAvjo384NNIFWyhCwvbCLvpgTplMCp896DWLlXu9eaGUCNjT/sZM8zafAXbfc6OKYFQ5iANAiJktWwKaUaphJkbSVWT5',
    key_id   => 'elizabeth@r2d2',
    uid      => 2015,
    gid      => 2015,
  }

  @user::virtual::localuser { 'jhesketh':
    realname => 'Joshua Hesketh',
    sshkeys  => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQC3onVLOZiiGpQWTCIV0QwHmc3Jvqyl7UaJxIu7D49OQcLHqVZsozI9pSiCdTnWyAaM+E+5wD9yVcSTqMWqn2AZmZSwQ+Fh6KnCgPZ/o63+iCZPGL0RNk20M1iNh5dvdStDnn+j2fpeV/JONF0tBn07QvNL2eF4BwtbTG9Zhl186QNsXjXDghrSO3Etl6DSfcUhxyvMoA2LnclWWD5hLmiRhcBm+PIxveVsr4B+o0k1HV5SUOvJMWtbEC37AH5I818O4fNOob6CnOFaCsbA9oUDzB5rqxutPZb9SmNJpNoLqYqDgyppM0yeql0Kn97tUt7H4j5xHrWoGnJ4IXfuDc0AMmmy4fpcLGkNf7zcBftKS6iz/3AlOXjlp5WZvKxngJj9HIir2SE/qV4Lxw9936BzvAcQyw5+bEsLQJwi+LPZxEqLC6oklkX9dg/+1yBFHsz6mulA0b4Eq7VF9omRzrhhN4iPpU5KQYPRNz7yRYckXDxYnp2lz6yHgSYh2/lqMc+UqmCL9EAWcDw3jsgvJ6kH/YUVUojiRHD9QLqlhOusu1wrTfojjwF05mqkXKmH+LH8f8AJAlMdYg0c2WLlrcxnwCkLLxzU5cYmKcZ41LuLtQR3ik+EKjYzBXXyCEzFm6qQEbR2akpXyxvONgrf7pijrgNOi0GeatUt0bUQcAONYw==',
    key_id   => 'jhesketh@infra',
    uid      => 2016,
    gid      => 2016,
  }

  @user::virtual::localuser { 'jklare':
    realname => 'Jan Klare',
    sshkeys  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQC/tIv/7WG7D5qNDE5GE2GF1ZkAja1sSYRomcIa77yV8Dvx3xH7ReT8wpaLYypNt5NumQPWOCRGdItcmhvFHWzPm1AwN5oW5tb7+XYGdra//nUQ5ARXAQx7PkRjnLXyQsXGEgzPqVRIprtYGWO4vbRXCfNNn1HhoikgPJB/pbEbUN2wHSYGKi21vzF+aDTYVeETWOiR1sqHUc6HgTGV0fGyHAfy7UQxmr0j94UBCy6B/CLRTe5U/8M73XVPTfHOKD5jeBbcZODR0n8EZXGSHLdD8jRTa2/oFcgqn5wZSgHseAorTDs0aPYFSSUTflvTbilWip7i0wg8AdLAEw7JnIfx',
    key_id   => 'jklare@jklare-VirtualBox',
    uid      => 3001,
    gid      => 3001,
  }

  @user::virtual::localuser { 'jrosenboom':
    realname => 'Jens Rosenboom',
    sshkeys  => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQCxBkH6rMEVEwWaysNK5tbsOycdl4X7S7sRlkZcKiuT16yUAQNv6K9iFnEYXIPqMDx3Yj/7J7aeLwzPaHixUMFrdpl8O3IbiII+DOc3YFkaIAyuHa+D7dp2otwgeA+730ELE2h0eBfcmejg9um2gZtkHo6M3GJP9Wn9v1Vt/xNNDeBWpGqLC2JClASiEtYCXvkgvv36XQN2dTnqKaVEbMkE1aHkD1dXxa5ugxeawgpETatvd5mRrv85HVgwfNe7sjIuxA1Y6wz1tT8vUMx0hmD8R5CVhwlTXNqbxrCl69CLxwOFHOkbwm6egbHiVgCTtRbM8dwlt+4gJ3FlJcCa9Ydb',
    key_id   => 'jrosenboom@local',
    uid      => 3002,
    gid      => 3002,
  }

}
