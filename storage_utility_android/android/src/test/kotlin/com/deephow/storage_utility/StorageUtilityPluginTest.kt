package com.deephow.storage_utility

import android.os.StatFs
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import org.mockito.MockedConstruction
import kotlin.test.Test
import org.mockito.Mockito
import kotlin.test.AfterTest
import kotlin.test.BeforeTest

/*
 * This demonstrates a simple unit test of the Kotlin portion of this plugin's implementation.
 *
 * Once you have built the plugin's example app, you can run these tests from the command
 * line by running `./gradlew testDebugUnitTest` in the `example/android/` directory, or
 * you can run them directly from IDEs that support JUnit such as Android Studio.
 */

internal class StorageUtilityPluginTest {
    private lateinit var mockStatFs: MockedConstruction<StatFs>

    @BeforeTest
    fun setUp() {
        mockStatFs = Mockito.mockConstruction(
            StatFs::class.java
        ) { mock, _ ->
            Mockito.`when`(mock.totalBytes).thenReturn(123456789L)
            Mockito.`when`(mock.availableBytes).thenReturn(654321L)
        }
    }

    @Test
    fun onMethodCall_getFreeBytes_returnsExpectedValue() {
        val plugin = StorageUtilityPlugin()

        val call = MethodCall("getFreeBytes", hashMapOf("path" to "/data"))
        val mockResult: MethodChannel.Result = Mockito.mock(MethodChannel.Result::class.java)
        plugin.onMethodCall(call, mockResult)

        Mockito.verify(mockStatFs.constructed()[0]).availableBytes
        Mockito.verify(mockResult).success(654321L)
    }

    @Test
    fun onMethodCall_getTotalBytes_returnsExpectedValue() {
        val plugin = StorageUtilityPlugin()

        val call = MethodCall("getTotalBytes", hashMapOf("path" to "/data"))
        val mockResult: MethodChannel.Result = Mockito.mock(MethodChannel.Result::class.java)
        plugin.onMethodCall(call, mockResult)

        Mockito.verify(mockStatFs.constructed()[0]).totalBytes
        Mockito.verify(mockResult).success(123456789L)
    }

    @AfterTest
    fun cleanUp() {
        mockStatFs.close()
    }
}
