From: Angelo Dureghello <angelo@sysam.it>
Subject: Re: [PATCH] m68k/defconfig: amcore board defconfig tuning
Date: Mon, 9 Jan 2017 10:38:29 +0100
Message-ID: <16355760-9608-6220-65f2-44dd2abb2e28@sysam.it>
References: <1483486045-5635-1-git-send-email-angelo@sysam.it>
 <6a8520f4-fc2a-afb4-7b56-fc2bff3627fb@westnet.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from sysam.it ([5.39.81.93]:56216 "EHLO sysam.it"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754306AbdAIJic (ORCPT <rfc822;linux-m68k@vger.kernel.org>);
        Mon, 9 Jan 2017 04:38:32 -0500
In-Reply-To: <6a8520f4-fc2a-afb4-7b56-fc2bff3627fb@westnet.com.au>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gregungerer@westnet.com.au>, linux-m68k@vger.kernel.org

Hi Greg,


On 09/01/2017 06:43, Greg Ungerer wrote:
> Hi Angelo,
>
> On 04/01/17 09:27, Angelo Dureghello wrote:
>> Signed-off-by: Angelo Dureghello <angelo@sysam.it>
>> ---
>>  arch/m68k/configs/amcore_defconfig | 14 ++++++++------
>>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> No problem with the change.
> But can you provide more information in the log message?
> What tuning are the changes achieving?

well, the change was driven mainly since i couldn't have
tcp accept working with recent mainline kernels until i enabled
CONFIG_SYN_COOKIES. With CONFIG_SYN_COOKIES tcp accept works
again, will try to go deeper a bit on this since i believe
tcp accepts should work also without CONFIG_SYN_COOKIES.

I also had the chance to "diet" a bit kernel size and enable
sysfs gpio.

I'll resend v2 later.

>
> Thanks
> Greg
>
>

Thanks,
Regards,
angelo dureghello

>
>> diff --git a/arch/m68k/configs/amcore_defconfig b/arch/m68k/configs/amcore_defconfig
>> index f108dd1..131b410 100644
>> --- a/arch/m68k/configs/amcore_defconfig
>> +++ b/arch/m68k/configs/amcore_defconfig
>> @@ -1,19 +1,20 @@
>> -CONFIG_LOCALVERSION="amcore-001"
>> +CONFIG_LOCALVERSION="amcore-002"
>>  CONFIG_DEFAULT_HOSTNAME="amcore"
>>  CONFIG_SYSVIPC=y
>>  # CONFIG_FHANDLE is not set
>>  # CONFIG_USELIB is not set
>>  CONFIG_LOG_BUF_SHIFT=14
>> -CONFIG_NAMESPACES=y
>>  CONFIG_CC_OPTIMIZE_FOR_SIZE=y
>>  # CONFIG_AIO is not set
>>  # CONFIG_ADVISE_SYSCALLS is not set
>>  # CONFIG_MEMBARRIER is not set
>>  CONFIG_EMBEDDED=y
>>  # CONFIG_VM_EVENT_COUNTERS is not set
>> +# CONFIG_SLUB_DEBUG is not set
>>  # CONFIG_COMPAT_BRK is not set
>>  # CONFIG_LBDAF is not set
>>  # CONFIG_BLK_DEV_BSG is not set
>> +# CONFIG_IOSCHED_CFQ is not set
>>  # CONFIG_MMU is not set
>>  CONFIG_M5307=y
>>  CONFIG_AMCORE=y
>> @@ -27,13 +28,14 @@ CONFIG_NET=y
>>  CONFIG_PACKET=y
>>  CONFIG_UNIX=y
>>  CONFIG_INET=y
>> +CONFIG_SYN_COOKIES=y
>>  # CONFIG_INET_XFRM_MODE_TRANSPORT is not set
>>  # CONFIG_INET_XFRM_MODE_TUNNEL is not set
>>  # CONFIG_INET_XFRM_MODE_BEET is not set
>>  # CONFIG_IPV6 is not set
>>  # CONFIG_WIRELESS is not set
>>  # CONFIG_UEVENT_HELPER is not set
>> -CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
>> +# CONFIG_FW_LOADER is not set
>>  # CONFIG_ALLOW_DEV_COREDUMP is not set
>>  CONFIG_CONNECTOR=y
>>  CONFIG_MTD=y
>> @@ -53,6 +55,7 @@ CONFIG_MTD_UCLINUX=y
>>  CONFIG_MTD_PLATRAM=y
>>  CONFIG_BLK_DEV_RAM=y
>>  CONFIG_NETDEVICES=y
>> +# CONFIG_NET_VENDOR_AMAZON is not set
>>  # CONFIG_NET_VENDOR_ARC is not set
>>  # CONFIG_NET_CADENCE is not set
>>  # CONFIG_NET_VENDOR_BROADCOM is not set
>> @@ -89,14 +92,12 @@ CONFIG_I2C=y
>>  CONFIG_I2C_CHARDEV=y
>>  # CONFIG_I2C_HELPER_AUTO is not set
>>  CONFIG_I2C_IMX=y
>> -CONFIG_PPS=y
>> +CONFIG_GPIO_SYSFS=y
>>  # CONFIG_HWMON is not set
>>  # CONFIG_USB_SUPPORT is not set
>>  CONFIG_RTC_CLASS=y
>>  # CONFIG_RTC_SYSTOHC is not set
>>  CONFIG_RTC_DRV_DS1307=y
>> -CONFIG_EXT2_FS=y
>> -CONFIG_EXT2_FS_XATTR=y
>>  # CONFIG_FILE_LOCKING is not set
>>  # CONFIG_DNOTIFY is not set
>>  # CONFIG_INOTIFY_USER is not set
>> @@ -108,6 +109,7 @@ CONFIG_ROMFS_BACKED_BY_BOTH=y
>>  # CONFIG_NETWORK_FILESYSTEMS is not set
>>  CONFIG_PRINTK_TIME=y
>>  # CONFIG_ENABLE_WARN_DEPRECATED is not set
>> +# CONFIG_ENABLE_MUST_CHECK is not set
>>  # CONFIG_SECTION_MISMATCH_WARN_ONLY is not set
>>  CONFIG_PANIC_ON_OOPS=y
>>  # CONFIG_SCHED_DEBUG is not set
>>
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
