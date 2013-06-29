From: Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH] arch: m68k: include: asm: define 'VM_DATA_DEFAULT_FLAGS'
 no matter whether has 'NOMMU' or not.
Date: Sat, 29 Jun 2013 20:01:06 +1200
Message-ID: <51CE9442.2020105__5150.47274898297$1372492917$gmane$org@gmail.com>
References: <51C548E2.1060104@asianux.com> <51C54A9B.9060009@asianux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <51C54A9B.9060009@asianux.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Chen Gang <gang.chen@asianux.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi,

> The same .config file, also report the compiling error below:
>
> drivers/i2c/busses/i2c-ocores.c:81:2: error: implicit declaration of =
function =E2=80=98iowrite8=E2=80=99 [-Werror=3Dimplicit-function-declar=
ation]
> drivers/i2c/busses/i2c-ocores.c:86:2: error: implicit declaration of =
function =E2=80=98iowrite16=E2=80=99 [-Werror=3Dimplicit-function-decla=
ration]
> drivers/i2c/busses/i2c-ocores.c:91:2: error: implicit declaration of =
function =E2=80=98iowrite32=E2=80=99 [-Werror=3Dimplicit-function-decla=
ration]
> drivers/i2c/busses/i2c-ocores.c:96:2: error: implicit declaration of =
function =E2=80=98ioread8=E2=80=99 [-Werror=3Dimplicit-function-declara=
tion]
> drivers/i2c/busses/i2c-ocores.c:101:2: error: implicit declaration of=
 function =E2=80=98ioread16=E2=80=99 [-Werror=3Dimplicit-function-decla=
ration]
> drivers/i2c/busses/i2c-ocores.c:106:2: error: implicit declaration of=
 function =E2=80=98ioread32=E2=80=99 [-Werror=3Dimplicit-function-decla=
ration]
>
> Excuse me, I am not quite familiar with the related hardware and m68k=
,
> I guess under m68k architecture, we need not this drivers, is it corr=
ect ?

That would be correct, yes. Perhaps add appropriate dependencies in=20
drivers/i2c/Kconfig to allow building I2C drivers
only on hardware that supports it?

(Joking - some fallout would be expected when using make randconfig)

Cheers,

     Michael


> Thanks.
>
>
> On 06/22/2013 02:49 PM, Chen Gang wrote:
>> Define 'VM_DATA_DEFAULT_FLAGS' when 'NOMMU' to pass compiling.
>>
>> So move it from "include/asm/page_mm.h to "include/asm/page.h"
>>
>> The related make:
>>
>>    make ARCH=3Dm68k randconfig
>>    make ARCH=3Dm68k menuconfig
>>      choose cross compiler
>>      disable MMU support
>>    make ARCH=3Dm68k V=3D1 EXTRA_CFLAGS=3D-W
>>
>> The related error:
>>
>>    security/selinux/hooks.c: In function =EF=BF=BDselinux_init=EF=BF=
=BD:
>>    security/selinux/hooks.c:5821:21: error: =EF=BF=BDVM_DATA_DEFAULT=
_FLAGS=EF=BF=BD undeclared (first use in this function)
>>
>> (the attachment is the related .config file)
>>
>>
>> Signed-off-by: Chen Gang <gang.chen@asianux.com>
>> ---
>>   arch/m68k/include/asm/page.h    |    3 +++
>>   arch/m68k/include/asm/page_mm.h |    3 ---
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/m68k/include/asm/page.h b/arch/m68k/include/asm/pa=
ge.h
>> index 7c360da..38b024a 100644
>> --- a/arch/m68k/include/asm/page.h
>> +++ b/arch/m68k/include/asm/page.h
>> @@ -48,6 +48,9 @@ extern unsigned long _ramend;
>>   #include <asm/page_no.h>
>>   #endif
>>  =20
>> +#define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | VM_EXEC | \
>> +				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
>> +
>>   #include <asm-generic/getorder.h>
>>  =20
>>   #endif /* _M68K_PAGE_H */
>> diff --git a/arch/m68k/include/asm/page_mm.h b/arch/m68k/include/asm=
/page_mm.h
>> index 89f2014..5029f73 100644
>> --- a/arch/m68k/include/asm/page_mm.h
>> +++ b/arch/m68k/include/asm/page_mm.h
>> @@ -173,7 +173,4 @@ static inline __attribute_const__ int __virt_to_=
node_shift(void)
>>  =20
>>   #endif /* __ASSEMBLY__ */
>>  =20
>> -#define VM_DATA_DEFAULT_FLAGS	(VM_READ | VM_WRITE | VM_EXEC | \
>> -				 VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC)
>> -
>>   #endif /* _M68K_PAGE_MM_H */
>>
>
