
import { test, describe } from 'node:test'
import { equal } from 'node:assert'


import { DataUsaSDK } from '..'


describe('exists', async () => {

  test('test-mode', async () => {
    const testsdk = await DataUsaSDK.test()
    equal(null !== testsdk, true)
  })

})
