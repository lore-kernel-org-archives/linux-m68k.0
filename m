From: Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH] pci:  Add and use PCI_GENERIC_SETUP Kconfig entry
Date: Fri, 23 Jun 2017 15:08:56 -0700
Message-ID: <20170623220857.28774-1-palmer__1814.66193539581$1498255759$gmane$org@dabbelt.com>
References: <20170623220104.GE31455@jhogan-linux.le.imgtec.org>
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <20170623220104.GE31455@jhogan-linux.le.imgtec.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: rth@twiddle.net, ink@jurassic.park.msu.ru, mattst88@gmail.com, vgupta@synopsys.com, linux@armlinux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, geert@linux-m68k.org, ralf@linux-mips.org, ysato@users.sourceforge.jp, dalias@libc.org, davem@davemloft.net, cmetcalf@mellanox.com, gxt@mprc.pku.edu.cn, bhelgaas@google.com, viro@zeniv.linux.org.uk, akpm@linux-foundation.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org, linux-mips@linux-mips.org, linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, linux-pci@vger.kernel.org, hch@infradead.org

On Fri, 23 Jun 2017 15:01:04 PDT (-0700), james.hogan@imgtec.com wrote:
> On Fri, Jun 23, 2017 at 02:45:38PM -0700, Palmer Dabbelt wrote:
>> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
>> index 4c1a35f15838..86872246951c 100644
>> --- a/arch/arm/Kconfig
>> +++ b/arch/arm/Kconfig
>> @@ -96,6 +96,7 @@ config ARM
>>      select PERF_USE_VMALLOC
>>      select RTC_LIB
>>      select SYS_SUPPORTS_APM_EMULATION
>> +    select PCI_GENERIC_SETUP
>>      # Above selects are sorted alphabetically; please add new ones
>>      # according to that.  Thanks.
>
> This comment seems to suggest PCI_GENERIC_SETUP should be added a few
> lines up to preserve the alphabetical sorting.
>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index b2024db225a9..6c684d8c8816 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -115,6 +115,7 @@ config ARM64
>>      select SPARSE_IRQ
>>      select SYSCTL_EXCEPTION_TRACE
>>      select THREAD_INFO_IN_TASK
>> +    select PCI_GENERIC_SETUP
>
> Here too.
>
>> diff --git a/arch/tile/Kconfig b/arch/tile/Kconfig
>> index 4583c0320059..6679af85a882 100644
>> --- a/arch/tile/Kconfig
>> +++ b/arch/tile/Kconfig
>> @@ -33,6 +33,7 @@ config TILE
>>      select USER_STACKTRACE_SUPPORT
>>      select USE_PMC if PERF_EVENTS
>>      select VIRT_TO_BUS
>> +    select PCI_GENERIC_SETUP
>
> and here
>
> Otherwise
> Reviewed-by: James Hogan <james.hogan@imgtec.com>

Whoops -- I guess I was just on autopilot after seeing the first one not be
alphabetized.  A fixed patch is in a threaded message.
