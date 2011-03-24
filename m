From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/1] m68k: merge m68k and m68knommu arch
	directories
Date: Thu, 24 Mar 2011 09:06:08 +0100
Message-ID: <AANLkTik37qYtMOWENPvRmhqqPkUCTL79_cqZ-0e_i2o7@mail.gmail.com>
References: <1300768985-902-1-git-send-email-gerg@snapgear.com>
	<AANLkTimHzPn2Xe1RVRQKjwdynDvc3iL2=8kJ1p8kRZQ4@mail.gmail.com>
	<4D8A7B7F.2050405@snapgear.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <4D8A7B7F.2050405@snapgear.com>
List-Unsubscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Sender: uclinux-dev-bounces@uclinux.org
Errors-To: uclinux-dev-bounces@uclinux.org
To: Greg Ungerer <gerg@snapgear.com>
Cc: linux-m68k@vger.kernel.org, Linux-Next <linux-next@vger.kernel.org>, uclinux-dev@uclinux.org, linux-kernel@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

Hi Greg,

On Thu, Mar 24, 2011 at 00:00, Greg Ungerer <gerg@snapgear.com> wrote:
> On 24/03/11 08:07, Geert Uytterhoeven wrote:
>> On Tue, Mar 22, 2011 at 05:43,<gerg@snapgear.com> =C2=A0wrote:
>>> slso on the for-next branch in that tree, so will get some testing
>>> in the next tree for the next few days.
>>
>> defconfig is now a nommu-config, and it fails?
>>
>> http://kisskb.ellerman.id.au/kisskb/buildresult/4012794/
>
> Yep, that looks wrong. I'll move the define for KBUILD_DEFCONFIG
> into arch/m68k/Makefile (and remove the existing defines in Makefile_mm
> and Makefile_no). That will make the DEFCONFIG as it was before,
> multi_defconfig.
>
>> arch/m68k/kernel/entry_no.S:47: Error: Unknown operator -- statement
>> `save_all' ignored
>
> This is due to compiling for the non-mmu targets and not using
> a m68k-uclinux- toolchain. Unfortunately the compiler must define
> __uClinux__ to compile for non-mmu targets. This isn't new, we

For userland...

> have had this problem ever since the merge of the header files.
> (The exported headers need some switch to use to base some
> conditionals on, and kernel config options cannot be used in
> exported headers).

For kernels, we can explicitly define this in arch/m68k/Makefile if !MMU, r=
ight?

> But with a fixed defconfig, you won't see this anymore :-)
>
> I'll fix up the git commit on m68knommu git tree.

Good, thx!

Gr{oetje,eeting}s,

=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0 =C2=A0=C2=A0 -- Linus Torvalds
_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
