From: Fengguang Wu <fengguang.wu@intel.com>
Subject: Re: [PATCH] m68k: add generic atomic64_t support
Date: Sun, 12 Aug 2012 22:55:52 +0800
Message-ID: <20120812145552.GA17062@localhost>
References: <20120812142355.GA16664@localhost>
 <CAMuHMdXNC1SR5HgScihSc=WyX5bk4xB2LefpbS8ZuKJfDTF64A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-m68k-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdXNC1SR5HgScihSc=WyX5bk4xB2LefpbS8ZuKJfDTF64A@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>

On Sun, Aug 12, 2012 at 04:47:31PM +0200, Geert Uytterhoeven wrote:
> Hi Fengguang,
> 
> On Sun, Aug 12, 2012 at 4:23 PM, Fengguang Wu <fengguang.wu@intel.com> wrote:
> > This fixes build errors like:
> >
> > fs/namespace.c:2290:1: error: unknown type name 'atomic64_t'
> > fs/namespace.c:2290:1: error: implicit declaration of function 'ATOMIC64_INIT' [-Werror=implicit-function-declaration]
> > fs/namespace.c:2290:1: error: initializer element is not constant
> > fs/namespace.c: In function 'alloc_mnt_ns':
> > fs/namespace.c:2299:2: error: implicit declaration of function 'atomic64_add_return' [-Werror=implicit-function-declaration]
> 
> > Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
> > ---
> >  arch/m68k/Kconfig |    1 +
> >  1 file changed, 1 insertion(+)
> >
> > --- linux.orig/arch/m68k/Kconfig        2012-08-12 21:15:49.730533572 +0800
> > +++ linux/arch/m68k/Kconfig     2012-08-12 22:19:56.202624988 +0800
> > @@ -12,6 +12,7 @@ config M68K
> >         select FPU if MMU
> >         select ARCH_WANT_IPC_PARSE_VERSION
> >         select ARCH_USES_GETTIMEOFFSET if MMU && !COLDFIRE
> > +       select GENERIC_ATOMIC64
> 
> For several CPU types (68020/68030/68040/68080), this is already selected in
> arch/m68k/Kconfig.cpu
> So probably this select should be moved to cover more CPU types?
 
Got it! If possible, will you do that move? You surely know it much
better than me :)

> For which config do you get this build error? I can't seem to trigger it in
> current mainline nor -next with m5475evb_defconfig.
> Does it depend on additional patches to introduce more atomic64 uses?

Yes, it's triggered on Eric's userns tree. I just sent out another
email with details.  Sorry that I blindly used it as an example in the
changelog, w/o foreseeing it caused reproduce trouble on your side..

Thanks,
Fengguang
