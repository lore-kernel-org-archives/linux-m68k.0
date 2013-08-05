From: Greg Ungerer <gregungerer@westnet.com.au>
Subject: Re: [PATCH] arch: m68k: include: asm: define 'VM_DATA_DEFAULT_FLAGS'
 no matter whether has 'NOMMU' or not.
Date: Mon, 05 Aug 2013 10:50:26 +1000
Message-ID: <51FEF6D2.2090009__7496.08560367978$1375664541$gmane$org@westnet.com.au>
References: <51C548E2.1060104@asianux.com> <51C54A9B.9060009@asianux.com> <51CE9442.2020105@gmail.com> <CAMuHMdVAQJWDem0=uMnH7iVrckxPJ9cPn=8pYOusNov+wW5VeA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVAQJWDem0=uMnH7iVrckxPJ9cPn=8pYOusNov+wW5VeA@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Schmitz <schmitzmic@gmail.com>, Chen Gang <gang.chen@asianux.com>, linux-m68k <linux-m68k@lists.linux-m68k.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, uClinux development list <uclinux-dev@uclinux.org>

Hi Geert,

On 29/06/13 18:26, Geert Uytterhoeven wrote:
> On Sat, Jun 29, 2013 at 10:01 AM, Michael Schmitz <schmitzmic@gmail.c=
om> wrote:
>>> The same .config file, also report the compiling error below:
>>>
>>> drivers/i2c/busses/i2c-ocores.c:81:2: error: implicit declaration o=
f
>>> function =E2=80=98iowrite8=E2=80=99 [-Werror=3Dimplicit-function-de=
claration]
>>> drivers/i2c/busses/i2c-ocores.c:86:2: error: implicit declaration o=
f
>>> function =E2=80=98iowrite16=E2=80=99 [-Werror=3Dimplicit-function-d=
eclaration]
>>> drivers/i2c/busses/i2c-ocores.c:91:2: error: implicit declaration o=
f
>>> function =E2=80=98iowrite32=E2=80=99 [-Werror=3Dimplicit-function-d=
eclaration]
>>> drivers/i2c/busses/i2c-ocores.c:96:2: error: implicit declaration o=
f
>>> function =E2=80=98ioread8=E2=80=99 [-Werror=3Dimplicit-function-dec=
laration]
>>> drivers/i2c/busses/i2c-ocores.c:101:2: error: implicit declaration =
of
>>> function =E2=80=98ioread16=E2=80=99 [-Werror=3Dimplicit-function-de=
claration]
>>> drivers/i2c/busses/i2c-ocores.c:106:2: error: implicit declaration =
of
>>> function =E2=80=98ioread32=E2=80=99 [-Werror=3Dimplicit-function-de=
claration]
>>>
>>> Excuse me, I am not quite familiar with the related hardware and m6=
8k,
>>> I guess under m68k architecture, we need not this drivers, is it co=
rrect ?
>=20
> Until someone synthesizes the OpenCores i2c core together with the
> OpenCores 68000 core (they seem to have one), and tries to run uClinu=
x
> on it...
>=20
>> That would be correct, yes. Perhaps add appropriate dependencies in
>> drivers/i2c/Kconfig to allow building I2C drivers
>> only on hardware that supports it?
>=20
> We still want it for compile-coverage.
>=20
> Now, the issue is that m68knommu doesn't implement ioread8() and
> friends, so I'm adding the uClinux list.

I think this is relatively strait forward to fix. And we end up
making m68knommu targets consistent with the MMU m68k targets in
the process.

Regards
Greg



[PATCH] m68knommu: user generic iomap to support ioread*/iowrite*

There is no reason we cannot use the generic iomap support to give us
the ioread* and iowrite* family of IO access functions. The m68k arch w=
ith
MMU enabled does, so this makes us consistent for all m68k now.

Some potentially valid drivers will fail to compile without these,
for example:

drivers/i2c/busses/i2c-ocores.c:81:2: error: implicit declaration of
function =E2=80=98iowrite8=E2=80=99 [-Werror=3Dimplicit-function-declar=
ation]
drivers/i2c/busses/i2c-ocores.c:86:2: error: implicit declaration of
function =E2=80=98iowrite16=E2=80=99 [-Werror=3Dimplicit-function-decla=
ration]
drivers/i2c/busses/i2c-ocores.c:91:2: error: implicit declaration of
function =E2=80=98iowrite32=E2=80=99 [-Werror=3Dimplicit-function-decla=
ration]
drivers/i2c/busses/i2c-ocores.c:96:2: error: implicit declaration of
function =E2=80=98ioread8=E2=80=99 [-Werror=3Dimplicit-function-declara=
tion]
drivers/i2c/busses/i2c-ocores.c:101:2: error: implicit declaration of
function =E2=80=98ioread16=E2=80=99 [-Werror=3Dimplicit-function-declar=
ation]
drivers/i2c/busses/i2c-ocores.c:106:2: error: implicit declaration of
function =E2=80=98ioread32=E2=80=99 [-Werror=3Dimplicit-function-declar=
ation]

Signed-off-by: Greg Ungerer <gerg@uclinux.org>
---
 arch/m68k/Kconfig             | 2 +-
 arch/m68k/include/asm/io_no.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
index 821170e..c3cda41 100644
--- a/arch/m68k/Kconfig
+++ b/arch/m68k/Kconfig
@@ -11,6 +11,7 @@ config M68K
 	select VIRT_TO_BUS
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG if RMW_INSNS
 	select GENERIC_CPU_DEVICES
+	select GENERIC_IOMAP
 	select GENERIC_STRNCPY_FROM_USER if MMU
 	select GENERIC_STRNLEN_USER if MMU
 	select FPU if MMU
@@ -72,7 +73,6 @@ source "kernel/Kconfig.freezer"
 config MMU
 	bool "MMU-based Paged Memory Management Support"
 	default y
-	select GENERIC_IOMAP
 	help
 	  Select if you want MMU-based virtualised addressing space
 	  support by paged memory management. If unsure, say 'Y'.
diff --git a/arch/m68k/include/asm/io_no.h b/arch/m68k/include/asm/io_n=
o.h
index 353bf75..e153478 100644
--- a/arch/m68k/include/asm/io_no.h
+++ b/arch/m68k/include/asm/io_no.h
@@ -4,6 +4,7 @@
 #ifdef __KERNEL__
=20
 #include <asm/virtconvert.h>
+#include <asm-generic/iomap.h>
=20
 /*
  * These are for ISA/PCI shared memory _only_ and should never be used
