From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 05/11] m68k/atari: Add missing platform check before
 registering platform devices
Date: Sun, 25 Mar 2012 10:01:33 +0200
Message-ID: <CAMuHMdXcJCdt+X53zrSUbpvFxL2WzuQH6MWByFvQ5E0UT2LHYg@mail.gmail.com>
References: <1332323515-7314-1-git-send-email-geert@linux-m68k.org>
	<1332323515-7314-5-git-send-email-geert@linux-m68k.org>
	<4F6E950E.30809@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <4F6E950E.30809@gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Michael Schmitz <schmitzmic@googlemail.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org

Hi Michael,

On Sun, Mar 25, 2012 at 05:46, Michael Schmitz
<schmitzmic@googlemail.com> wrote:
>> On multi-platform kernels, the Atari platform devices should be regi=
stered
>> when running on Atari only. Else it may crash later.
>>
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> ---
>> =C2=A0arch/m68k/atari/config.c | =C2=A0 =C2=A03 +++
>> =C2=A01 files changed, 3 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/m68k/atari/config.c b/arch/m68k/atari/config.c
>> index af78731..35fb81d 100644
>> --- a/arch/m68k/atari/config.c
>> +++ b/arch/m68k/atari/config.c
>> @@ -693,6 +693,9 @@ static struct platform_device
>> *atari_platform_devices[] __initdata =3D {
>> =C2=A0int __init atari_platform_init(void)
>> =C2=A0{
>> + =C2=A0 =C2=A0 =C2=A0 if (!MACH_IS_ATARI)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
>> +
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0return platform_add_devices(atari_platfor=
m_devices,
>> ARRAY_SIZE(atari_platform_devices));
>> =C2=A0}
>>
>
>
> How about this instead - probe for the EtherNAT config register, and
> register devices only if found?

That's even better, but logically, it's an extra change on top, so I'd =
like
to keep it separate.

> (may apply with a bit of fuzz)
>
> Otherwise, Acked-by: Michael Schmitz <schmitz@debian.org>.
>
> --- arch/m68k/atari/config.c.org =C2=A0 =C2=A02012-03-25 16:02:12.000=
000000 +1300
> +++ arch/m68k/atari/config.c =C2=A0 =C2=A02012-03-25 13:37:21.0000000=
00 +1300
> @@ -753,7 +753,19 @@
>
> int __init atari_platform_init(void)
> {
> - =C2=A0 =C2=A0return platform_add_devices(atari_platform_devices,
> ARRAY_SIZE(atari_platform_devices));
> + =C2=A0 =C2=A0if (MACH_IS_ATARI) {

I prefer the "if (!MACH_IS_ATARI) return -ENODEV;" at the top, as it
  - means less code to change if more platform devices are added,
  - means less source code to keep on your mental stack when reading th=
e code,
  - decreases indentation for the rest of the function.

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 ethernat_cr;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned long enatc_phys =3D 0x80000023;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char *enatc_virt;
> + =C2=A0 =C2=A0 =C2=A0 + =C2=A0 =C2=A0 =C2=A0 =C2=A0enatc_virt =3D (u=
nsigned char *)ioremap(enatc_phys, 0xf);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0if (hwreg_present(enatc_virt)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iounmap(enatc_virt);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return platform_add_device=
s(atari_platform_devices,
> ARRAY_SIZE(atari_platform_devices));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0iounmap(enatc_virt);
> + =C2=A0 =C2=A0}
> + =C2=A0 =C2=A0return -ENODEV; =C2=A0 }
>
> arch_initcall(atari_platform_init);

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
