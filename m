From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: asm/kvm_para.h from asm-generic (was: Re: linux-next: triage for
 April 19, 2012)
Date: Tue, 12 Jun 2012 23:07:05 +0200
Message-ID: <CAMuHMdW9D4FZSUibcd+qrtM+is75FyJXj+RxK+sb33XEjczdyg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kbuild-owner@vger.kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
To: linux-kbuild <linux-kbuild@vger.kernel.org>, Avi Kivity <avi@redhat.com>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>
List-Id: linux-m68k@vger.kernel.org

On Wed, May 30, 2012 at 10:52 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Mon, May 28, 2012 at 5:04 PM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Mon, May 28, 2012 at 4:37 PM, Avi Kivity <avi@redhat.com> wrote:
>>> On 05/25/2012 11:59 PM, Geert Uytterhoeven wrote:
>>>> On Fri, Apr 20, 2012 at 4:00 AM, Paul Gortmaker
>>>> <paul.gortmaker@windriver.com> wrote:
>>>>> The parisc got borked by some kvm header shuffle it seems?
>>>>> Now complaining about "file 'asm-generic/kvm_para.h' is not expor=
ted"
>>>>> [ http://kisskb.ellerman.id.au/kisskb/buildresult/6137786/ ]
>>>>
>>>> Not only parisc.
>>>>
>>>> This breakage has now entered mainline:
>>>>
>>>> parisc deconfig http://kisskb.ellerman.id.au/kisskb/buildresult/63=
65677/
>>>> m68k allmodconfig: http://kisskb.ellerman.id.au/kisskb/buildresult=
/6365681/
>>>
>>>
>>> Does the following patch help?
>>
>> Thanks, that fixes it!
>>
>> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>
>>> From: Avi Kivity <avi@redhat.com>
>>> Date: Mon, 28 May 2012 17:35:22 +0300
>>> Subject: [PATCH] KVM: Export asm-generic/kvm_para.h
>>>
>>> Prevents build failures on non-KVM archs.
>>>
>>> Signed-off-by: Avi Kivity <avi@redhat.com>
>>> ---
>>> =C2=A0include/asm-generic/Kbuild | =C2=A0 =C2=A01 +
>>> =C2=A01 file changed, 1 insertion(+)
>>>
>>> diff --git a/include/asm-generic/Kbuild b/include/asm-generic/Kbuil=
d
>>> index 53f91b1..2c85a0f 100644
>>> --- a/include/asm-generic/Kbuild
>>> +++ b/include/asm-generic/Kbuild
>>> @@ -8,6 +8,7 @@ header-y +=3D int-ll64.h
>>> =C2=A0header-y +=3D ioctl.h
>>> =C2=A0header-y +=3D ioctls.h
>>> =C2=A0header-y +=3D ipcbuf.h
>>> +header-y +=3D kvm_para.h
>>> =C2=A0header-y +=3D mman-common.h
>>> =C2=A0header-y +=3D mman.h
>>> =C2=A0header-y +=3D msgbuf.h
>
> I just noticed include/asm-generic/Kbuild.asm already had
>
> ifneq ($(wildcard $(srctree)/arch/$(SRCARCH)/include/asm/kvm_para.h \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(srctr=
ee)/include/asm-$(SRCARCH)/kvm_para.h),)
> header-y =C2=A0+=3D kvm_para.h
> endif
>
> but this doesn't seem to work.
>
> Kbuild people: which one is correct?

Oops...

After linux-next commit 2bbc89a8e9c652ee71c6c3b2e0679b7ecedb1a09
("m68k: Use Kbuild logic to import asm-generic headers"), which does:
  - remove arch/m68k/include/asm/kvm_para.h, which just included the
    asm-generic version,
  - add "generic-y +=3D kvm_para.h" to arch/m68k/include/asm/Kbuild,
it fails again:

$ make ARCH=3Dm68k headers_check
  CHK     include/linux/version.h
  INSTALL include/asm-generic (35 files)
  INSTALL include/linux (372 files)
  CHECK   include/asm-generic (35 files)
  CHECK   include/linux (372 files)
usr/include/linux/kexec.h:49: userspace cannot reference function or
variable defined in the kernel
usr/include/linux/kvm_para.h:26: included file 'asm-m68k/kvm_para.h'
is not exported
usr/include/linux/soundcard.h:1054: userspace cannot reference
function or variable defined in the kernel
make[2]: *** [usr/include/linux/.check] Error 123
make[1]: *** [linux] Error 2
make: *** [headers_check] Error 2
$

After reverting Avi's fix (commit
7beb8e723c8d7da7decbbe217b79525aef73fccb. ("KVM:
Export asm-generic/kvm_para.h")) it works again. Note that it now _remo=
ves_
kvm_para.h:

$ make ARCH=3Dm68k headers_check
  CHK     include/linux/version.h
  REMOVE  kvm_para.h
  INSTALL include/asm-generic (34 files)
  REMOVE  kvm_para.h
  INSTALL include/linux (371 files)
  CHECK   include/asm-generic (34 files)
  CHECK   include/linux (371 files)
usr/include/linux/kexec.h:49: userspace cannot reference function or
variable defined in the kernel
usr/include/linux/soundcard.h:1054: userspace cannot reference
function or variable defined in the kernel
$

What's the proper way to get this working in both cases??
  1. arch has it's own asm/kvm_para.h (cfr. m68k and all other arches
in mainline)
  2. arch includes asm-generic/kvm_para.h via Kbuild logic (cfr.
(only) m68k in -next)
Or is this not possible, and should I create arch/m68k/include/asm/kvm_=
para.h
again, like all other arches seem to do?

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
--
To unsubscribe from this list: send the line "unsubscribe linux-kbuild"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
