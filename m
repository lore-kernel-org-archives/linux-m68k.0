From: Greg Ungerer <gerg@snapgear.com>
Subject: Re: [PATCH] m68k: add generic atomic64_t support
Date: Mon, 13 Aug 2012 16:13:47 +1000
Message-ID: <50289B1B.2060104@snapgear.com>
References: <20120812142355.GA16664@localhost> <CAMuHMdXNC1SR5HgScihSc=WyX5bk4xB2LefpbS8ZuKJfDTF64A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXNC1SR5HgScihSc=WyX5bk4xB2LefpbS8ZuKJfDTF64A@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fengguang Wu <fengguang.wu@intel.com>, Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>

Hi Geert,

On 13/08/12 00:47, Geert Uytterhoeven wrote:
> Hi Fengguang,
>
> On Sun, Aug 12, 2012 at 4:23 PM, Fengguang Wu <fengguang.wu@intel.com> wrote:
>> This fixes build errors like:
>>
>> fs/namespace.c:2290:1: error: unknown type name 'atomic64_t'
>> fs/namespace.c:2290:1: error: implicit declaration of function 'ATOMIC64_INIT' [-Werror=implicit-function-declaration]
>> fs/namespace.c:2290:1: error: initializer element is not constant
>> fs/namespace.c: In function 'alloc_mnt_ns':
>> fs/namespace.c:2299:2: error: implicit declaration of function 'atomic64_add_return' [-Werror=implicit-function-declaration]
>
>> Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
>> ---
>>   arch/m68k/Kconfig |    1 +
>>   1 file changed, 1 insertion(+)
>>
>> --- linux.orig/arch/m68k/Kconfig        2012-08-12 21:15:49.730533572 +0800
>> +++ linux/arch/m68k/Kconfig     2012-08-12 22:19:56.202624988 +0800
>> @@ -12,6 +12,7 @@ config M68K
>>          select FPU if MMU
>>          select ARCH_WANT_IPC_PARSE_VERSION
>>          select ARCH_USES_GETTIMEOFFSET if MMU && !COLDFIRE
>> +       select GENERIC_ATOMIC64
>
> For several CPU types (68020/68030/68040/68080), this is already selected in
> arch/m68k/Kconfig.cpu
> So probably this select should be moved to cover more CPU types?

I think we need CONFIG_GENERIC_ATOMC64 for all the other types too.
Is there any reason we can't remove all these CPU defined ones and
have a single select for m68k?

Tested and verified on a variety of ColdFire targets if I do that.

Regards
Greg



> For which config do you get this build error? I can't seem to trigger it in
> current mainline nor -next with m5475evb_defconfig.
> Does it depend on additional patches to introduce more atomic64 uses?
>
> Gr{oetje,eeting}s,
>
>                          Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds
>
>
>


-- 
------------------------------------------------------------------------
Greg Ungerer  --  Principal Engineer        EMAIL:     gerg@snapgear.com
SnapGear Group, McAfee                      PHONE:       +61 7 3435 2888
8 Gardner Close                             FAX:         +61 7 3217 5323
Milton, QLD, 4064, Australia                WEB: http://www.SnapGear.com
