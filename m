From: Steven King <sfking@fdwdc.com>
Subject: Re: [PATCH] [Repost without wordwrapping] Merge m68k
	and m68knommu
Date: Thu, 19 Nov 2009 05:49:53 -0800
Message-ID: <200911190549.53749.sfking@fdwdc.com>
References: <200910181655.40579.sfking00@yahoo.com>
	<10f740e80911181332u48f8e610o4354cfd3994c8510@mail.gmail.com>
Reply-To: uClinux development list <uclinux-dev@uclinux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <uclinux-dev-bounces@uclinux.org>
In-Reply-To: <10f740e80911181332u48f8e610o4354cfd3994c8510@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=unsubscribe>
List-Archive: <http://mailman.uclinux.org/pipermail/uclinux-dev>
List-Post: <mailto:uclinux-dev@uclinux.org>
List-Help: <mailto:uclinux-dev-request@uclinux.org?subject=help>
List-Subscribe: <http://mailman.uclinux.org/mailman/listinfo/uclinux-dev>,
	<mailto:uclinux-dev-request@uclinux.org?subject=subscribe>
Sender: uclinux-dev-bounces@uclinux.org
Errors-To: uclinux-dev-bounces@uclinux.org
To: linux-kernel@vger.kernel.org
Cc: Roman Zippel <zippel@linux-m68k.org>, linux-m68k@vger.kernel.org, uclinux-dev@uclinux.org
List-Id: linux-m68k@vger.kernel.org

On Wednesday 18 November 2009 01:32:25 Geert Uytterhoeven wrote:

> > The patch modifies the toplevel Makefile so that ARCH=3Dm68knommu still
> > works (by setting SRCARCH=3Dm68k) and adds the m68knommu Kconfig and
> > Makefile to the m68k Kconfig and Makefile, using the definition of ARCH
> > to select which values to use.
>
> (still dreaming of my pet Amiga-nommu project) I prefer to use
> CONFIG_MMU as the selector...

CONFIG_MMU is used as the selector elsewhere, but for Kconfig and the=20
Makefiles something else was needed.
>
> > Thus when building for either a m68k or an m68knommu target, one still
> > specifies either ARCH=3Dm68k or ARCH=3Dm68knommu and everything should
> > build EXACTLY as it did pre-merge. =C2=A0(I think).
>
> ... using CONFIG_MMU would change this?

Yes; originally I tried using CONFIG_MMU to choose between the mmu and nomm=
u=20
portions of the Kconfig and Makefile, but that broke the defconfigs.  Rathe=
r=20
than patch the defconfigs or make a more elaborate patch for the Kconfig, f=
or=20
this initial patch I wanted to keep it as simple and as un-invasive as=20
possible so that it would be trivial (?) to verify the merged kernel tree=20
produces a kernel that is the same as the pre-merged kernel tree, thus=20
providing a baseline for bisecting any problems with the subsequent patches=
=20
that do the real merging of the individual files.  A later patch will do a=
=20
better job of merging the Kconfigs and Makefiles.  Then you'd be able to ha=
ve=20
your Amiga-nommu and I can have my Coldfire 5484 either as mmu or nommu...

=2D-=20
Steven King -- sfking at fdwdc dot com

_______________________________________________
uClinux-dev mailing list
uClinux-dev@uclinux.org
http://mailman.uclinux.org/mailman/listinfo/uclinux-dev
This message was resent by uclinux-dev@uclinux.org
To unsubscribe see:
http://mailman.uclinux.org/mailman/options/uclinux-dev
