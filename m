From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Add missing ioport_unmap()
Date: Tue, 16 Sep 2014 08:47:43 +0200
Message-ID: <CAMuHMdUL-hjM+-hWOKMMth3kd=+ieN6=fEMcYm-eizJaNJc52A__43729.1085989729$1410850086$gmane$org@mail.gmail.com>
References: <1410687925-10880-1-git-send-email-geert@linux-m68k.org>
	<54163BC6.1080407@uclinux.org>
	<CAMuHMdXMHdrUELqkbtOvOUxzPYjeXb2u731CDRgGXRf1+hOwfw@mail.gmail.com>
	<5417D7D7.4080800@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <5417D7D7.4080800@uclinux.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Greg Ungerer <gerg@uclinux.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, uClinux development list <uclinux-dev@uclinux.org>

Hi Greg,

On Tue, Sep 16, 2014 at 8:25 AM, Greg Ungerer <gerg@uclinux.org> wrote:
> On 15/09/14 17:36, Geert Uytterhoeven wrote:
>> On Mon, Sep 15, 2014 at 3:07 AM, Greg Ungerer <gerg@uclinux.org> wro=
te:
>>> On 14/09/14 19:45, Geert Uytterhoeven wrote:
>>>> drivers/net/ethernet/cirrus/cs89x0.c: In function =E2=80=98cs89x0_=
ioport_probe=E2=80=99:
>>>> drivers/net/ethernet/cirrus/cs89x0.c:1629: error: implicit declara=
tion of function =E2=80=98ioport_unmap=E2=80=99
>>>>
>>>> Add the missing ioport_unmap() implementation, and convert ioport_=
map()
>>>> from a macro to a static inline function while we're at it (both c=
opied
>>>> from asm-generic).
>>>
>>> The non-mmu version of this, io_no.h, doesn't implement these eithe=
r.
>>> Should it?
>>
>> I think it should. However, you probably can't get there without PCI=
 or ISA
>> enabled.
>>
>> (doing some experiments with M548x/allmodconfig builds)
>>
>> Currently PCI on M54xx is limited to MMU=3Dy?
>
> Yes, though I am not sure why we have it limited to that case.

Yeah, I was wondering the same...

>> As soon as PCI can be enabled with MMU=3Dn, you can get to:
>>
>> lib/pci_iomap.c: In function =E2=80=98pci_iomap=E2=80=99:
>> lib/pci_iomap.c:37: error: implicit declaration of function =E2=80=98=
ioport_map=E2=80=99
>> lib/pci_iomap.c:37: warning: return makes pointer from integer witho=
ut a cast
>>
>> drivers/gpio/gpio-amd8111.c: In function =E2=80=98amd_gpio_init=E2=80=
=99:
>> drivers/gpio/gpio-amd8111.c:215: error: implicit declaration of
>> function =E2=80=98ioport_map=E2=80=99
>> drivers/gpio/gpio-amd8111.c:215: warning: assignment makes pointer
>> from integer without a cast
>> drivers/gpio/gpio-amd8111.c: In function =E2=80=98amd_gpio_exit=E2=80=
=99:
>> drivers/gpio/gpio-amd8111.c:236: error: implicit declaration of
>> function =E2=80=98ioport_unmap=E2=80=99
>
> Ok, I say yes we need it for non-MMU too. Do you want to come up with
> another patch for the non-MMU case, or do you want me to do it?

=46eel free to write a patch when you have time...

Groetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
