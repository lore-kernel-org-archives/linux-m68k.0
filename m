From: Greg Ungerer <gerg@uclinux.org>
Subject: Re: [PATCH] m68k: Add missing ioport_unmap()
Date: Tue, 16 Sep 2014 16:25:27 +1000
Message-ID: <5417D7D7.4080800__22683.7247414098$1410848743$gmane$org@uclinux.org>
References: <1410687925-10880-1-git-send-email-geert@linux-m68k.org>	<54163BC6.1080407@uclinux.org> <CAMuHMdXMHdrUELqkbtOvOUxzPYjeXb2u731CDRgGXRf1+hOwfw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdXMHdrUELqkbtOvOUxzPYjeXb2u731CDRgGXRf1+hOwfw@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>, uClinux development list <uclinux-dev@uclinux.org>

Hi Geert,

On 15/09/14 17:36, Geert Uytterhoeven wrote:
> On Mon, Sep 15, 2014 at 3:07 AM, Greg Ungerer <gerg@uclinux.org> wrot=
e:
>> On 14/09/14 19:45, Geert Uytterhoeven wrote:
>>> drivers/net/ethernet/cirrus/cs89x0.c: In function =E2=80=98cs89x0_i=
oport_probe=E2=80=99:
>>> drivers/net/ethernet/cirrus/cs89x0.c:1629: error: implicit declarat=
ion of function =E2=80=98ioport_unmap=E2=80=99
>>>
>>> Add the missing ioport_unmap() implementation, and convert ioport_m=
ap()
>>> from a macro to a static inline function while we're at it (both co=
pied
>>> from asm-generic).
>>
>> The non-mmu version of this, io_no.h, doesn't implement these either=
=2E
>> Should it?
>=20
> I think it should. However, you probably can't get there without PCI =
or ISA
> enabled.
>=20
> (doing some experiments with M548x/allmodconfig builds)
>=20
> Currently PCI on M54xx is limited to MMU=3Dy?

Yes, though I am not sure why we have it limited to that case.


> As soon as PCI can be enabled with MMU=3Dn, you can get to:
>=20
> lib/pci_iomap.c: In function =E2=80=98pci_iomap=E2=80=99:
> lib/pci_iomap.c:37: error: implicit declaration of function =E2=80=98=
ioport_map=E2=80=99
> lib/pci_iomap.c:37: warning: return makes pointer from integer withou=
t a cast
>=20
> drivers/gpio/gpio-amd8111.c: In function =E2=80=98amd_gpio_init=E2=80=
=99:
> drivers/gpio/gpio-amd8111.c:215: error: implicit declaration of
> function =E2=80=98ioport_map=E2=80=99
> drivers/gpio/gpio-amd8111.c:215: warning: assignment makes pointer
> from integer without a cast
> drivers/gpio/gpio-amd8111.c: In function =E2=80=98amd_gpio_exit=E2=80=
=99:
> drivers/gpio/gpio-amd8111.c:236: error: implicit declaration of
> function =E2=80=98ioport_unmap=E2=80=99

Ok, I say yes we need it for non-MMU too. Do you want to come up with
another patch for the non-MMU case, or do you want me to do it?

Regards
Greg
