/*
 * FreeRTOS V202002.00
 * Copyright (C) 2020 Amazon.com, Inc. or its affiliates.  All Rights Reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
 * the Software, and to permit persons to whom the Software is furnished to do so,
 * subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 * COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
 * IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 *
 * http://aws.amazon.com/freertos
 * http://www.FreeRTOS.org
 */

#ifndef AWS_CLIENT_CREDENTIAL_KEYS_H
#define AWS_CLIENT_CREDENTIAL_KEYS_H

/*
 * @brief PEM-encoded client certificate.
 *
 * @todo If you are running one of the FreeRTOS demo projects, set this
 * to the certificate that will be used for TLS client authentication.
 *
 * @note Must include the PEM header and footer:
 * "-----BEGIN CERTIFICATE-----\n"\
 * "...base64 data...\n"\
 * "-----END CERTIFICATE-----\n"
 */
#define keyCLIENT_CERTIFICATE_PEM  \
"-----BEGIN CERTIFICATE-----\n"\
"MIIDWTCCAkGgAwIBAgIUToOD243rNG95c8D5wngsEiRvuNAwDQYJKoZIhvcNAQEL\n"\
"BQAwTTFLMEkGA1UECwxCQW1hem9uIFdlYiBTZXJ2aWNlcyBPPUFtYXpvbi5jb20g\n"\
"SW5jLiBMPVNlYXR0bGUgU1Q9V2FzaGluZ3RvbiBDPVVTMB4XDTIwMDUyODA0MTcx\n"\
"MFoXDTQ5MTIzMTIzNTk1OVowHjEcMBoGA1UEAwwTQVdTIElvVCBDZXJ0aWZpY2F0\n"\
"ZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALEx5HeM8ChQjwhIExe3\n"\
"wX/RV2ePwREBOxWJqaOfSpSwHxdzpEfrDWU61kFrOjWq2pIz0tJlZaEEj8m+IXZp\n"\
"1FnGBibPUK9bl0zirUMaz3pe3N+Rtlm5ljW01ezptFNlA4Q75Q0LhAVULWKuu8d4\n"\
"+4ROEKXgAV6VT4c1adXataU2Pc2Ee1c3PRPN6wn970lM8yai4AabHW/OxmWlLM+a\n"\
"lrfhxOoTUjb963SjQV3rt/ImxzlVrgifRra8RXVyuTxHWuxDeTvSf4JOIv+zKpJW\n"\
"DeVMrWgOoOAFhYYSPHlMlS0ZxjfQKpECXy3ucf8pnDWAu33DgqWv5eV/kFXaj0zx\n"\
"120CAwEAAaNgMF4wHwYDVR0jBBgwFoAUvGBZvAAZnlhFVHbvY5Os1u6QcAMwHQYD\n"\
"VR0OBBYEFMnRnyV5nzDoSZJlybKFHfkyifriMAwGA1UdEwEB/wQCMAAwDgYDVR0P\n"\
"AQH/BAQDAgeAMA0GCSqGSIb3DQEBCwUAA4IBAQB8A48TP6NcBMyrd5JNlGqBO/t0\n"\
"XVIpVXLrg6UEKMXpd6pe/bgqpAEYWWmeugNHBh1oZ9jJK4w+epXgtNEEgo/7bGqQ\n"\
"yT9ujVhTUnItJ3UJ0H9U8f+WW4axUSDecH79g1UTjbH1MVYGl2YUHRvvk3kP/LIi\n"\
"k2rccTtV5fPn7FLmcy1gOe7LHYuB0qCkpOpi9GrExWVAjtgglIKpTPzFMlfBle/c\n"\
"YCV4g8JM+q455LotIlUpe37Zg/m3dSC02hlLxeKUtZjM5s3SMinLJK/D2P9GlxuR\n"\
"ghoXu/Ak2SR9G8RqZF2yeh+pr5wvQFkb54VifFJu4Cr6cySd07Gcly15NDb+\n"\
"-----END CERTIFICATE-----"

/*
 * @brief PEM-encoded issuer certificate for AWS IoT Just In Time Registration (JITR).
 *
 * @todo If you are using AWS IoT Just in Time Registration (JITR), set this to
 * the issuer (Certificate Authority) certificate of the client certificate above.
 *
 * @note This setting is required by JITR because the issuer is used by the AWS
 * IoT gateway for routing the device's initial request. (The device client
 * certificate must always be sent as well.) For more information about JITR, see:
 *  https://docs.aws.amazon.com/iot/latest/developerguide/jit-provisioning.html,
 *  https://aws.amazon.com/blogs/iot/just-in-time-registration-of-device-certificates-on-aws-iot/.
 *
 * If you're not using JITR, set below to NULL.
 *
 * Must include the PEM header and footer:
 * "-----BEGIN CERTIFICATE-----\n"\
 * "...base64 data...\n"\
 * "-----END CERTIFICATE-----\n"
 */
#define keyJITR_DEVICE_CERTIFICATE_AUTHORITY_PEM    NULL

/*
 * @brief PEM-encoded client private key.
 *
 * @todo If you are running one of the FreeRTOS demo projects, set this
 * to the private key that will be used for TLS client authentication.
 *
 * @note Must include the PEM header and footer:
 * "-----BEGIN RSA PRIVATE KEY-----\n"\
 * "...base64 data...\n"\
 * "-----END RSA PRIVATE KEY-----\n"
 */
#define keyCLIENT_PRIVATE_KEY_PEM   \
"-----BEGIN RSA PRIVATE KEY-----\n"\
"MIIEowIBAAKCAQEAsTHkd4zwKFCPCEgTF7fBf9FXZ4/BEQE7FYmpo59KlLAfF3Ok\n"\
"R+sNZTrWQWs6NarakjPS0mVloQSPyb4hdmnUWcYGJs9Qr1uXTOKtQxrPel7c35G2\n"\
"WbmWNbTV7Om0U2UDhDvlDQuEBVQtYq67x3j7hE4QpeABXpVPhzVp1dq1pTY9zYR7\n"\
"Vzc9E83rCf3vSUzzJqLgBpsdb87GZaUsz5qWt+HE6hNSNv3rdKNBXeu38ibHOVWu\n"\
"CJ9GtrxFdXK5PEda7EN5O9J/gk4i/7MqklYN5UytaA6g4AWFhhI8eUyVLRnGN9Aq\n"\
"kQJfLe5x/ymcNYC7fcOCpa/l5X+QVdqPTPHXbQIDAQABAoIBAA9Iw3FAefKwSDYp\n"\
"qWPxWMKCtyxarQefeI46CqTvd4ptyrDGK9R8RPKHabXI3wOEEkhsKfI2BtclwpVf\n"\
"ThmdtVBtEVjFpysJFnruTo2sQVtH1Xt/YSBKLtfBGnbODdznqK7+T5qZdLDU+vk5\n"\
"Iz9ogyF9blgwg026SVrbU567t9FhQH61xF0dw09kqE7dPgRW9EyNZD6xGLmxK/mI\n"\
"MukFw0l79RL1ik95uQf/MjqyMsjZGsQBTeAVLMIAI6t7MLd81maBIm6AeqGVcVE8\n"\
"mQFZeyDEEtjwYztR8R2AuW5yZRyG8/EOcnu/efbHkprhjwXY3Op6iUw+eig07OWA\n"\
"fhYuOu0CgYEA6Jujxh41eQuhT1+umBb7VXQFpB6tFyqbmD13JFvfk19PHmxweCZR\n"\
"KkCpn9it00sdlXa39gK7YnIqqWSfVIrEj5uBuKrGA4+/mg15G4bG3FZZAn3GNn4N\n"\
"ZScMKmJIc6V3AIoxayyR5lJxy6yPyEEn3kM2TYeCpp8rhqQJ2FZKP5cCgYEAwwOs\n"\
"q9qUm6FJYMUvSKIs/wn7+xkvZexao6Q1nvi/2DkK/pNBP7sVV3lAfihAOexfklmB\n"\
"PVOZIdkzecGgnn4WKK3XChTsu53HU+LJyNrPV38jU2CajlpO38YOUM2Ge7J5Iiay\n"\
"SV52pN0MMBtBHh0zMnx3kjCeQxfQ7l4zRmXoQZsCgYAdkaNpDPAJOiRAXc5pAQrk\n"\
"GwKYkVm5hy4OVUnu8krihgwdtvU5IM3SjDPD4Rx/rp3NITFTcZd2dULdE7B5Y8aG\n"\
"5uK/od3YGA7oO2w4xpJC8isQeQKYbL+xKxyNyr6hDNiq1eZgVGMbn0Fd/cqtTzMN\n"\
"OwgNJPvDyJoU3Idv29BGcwKBgDVqaT59VZ03VWEDQctUWJzXAEUsBdaWIdGW5fUQ\n"\
"T4QLQ96tOP8a4GKgXLDxl34GJ7tvdr30iwpBcx8TkUo4YRttWmxxhNJzCikJAppY\n"\
"jNh7g5KP8GWziM00c7FgSkjRfuqCzOzZygeoYHFA1dpIx0A55YqOdJsOB/VyqfrL\n"\
"aQ2nAoGBAI1DoMZisFZSRlFND6pHwEFgrwboDyLhuwbwf9Px6564RTxLtoNnM1OH\n"\
"E4uUazNuc4nUVQV2DfHt81X3oviMYUOTBQNbHkWFsFdTwyBGmLmUwomAj4c1aHDI\n"\
"DN09rntpxFpQIhoWHUJl532iuum5b2FHhnEXxFh2YEJBLrBE/jTH\n"\
"-----END RSA PRIVATE KEY-----"

#endif /* AWS_CLIENT_CREDENTIAL_KEYS_H */
