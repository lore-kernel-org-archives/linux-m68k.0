From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: asm/kvm_para.h from asm-generic (was: Re: linux-next: triage
	for April 19, 2012)
Date: Tue, 19 Jun 2012 21:00:08 +0200
Message-ID: <20120619190008.GA11092@merkur.ravnborg.org>
References: <CAMuHMdW9D4FZSUibcd+qrtM+is75FyJXj+RxK+sb33XEjczdyg@mail.gmail.com> <CAMuHMdVM3zn_OUAtGTV_O0d3yFWBM5b_6ORHxaMLVE27Cf_XrQ@mail.gmail.com> <20120619184803.GA31656@merkur.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kbuild-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120619184803.GA31656@merkur.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Avi Kivity <avi@redhat.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>, kvm@vger.kernel.org, Paul Mundt <lethal@linux-sh.org>
List-Id: linux-m68k@vger.kernel.org

On Tue, Jun 19, 2012 at 08:48:03PM +0200, Sam Ravnborg wrote:
> > >>
> > >> I just noticed include/asm-generic/Kbuild.asm already had
> > >>
> > >> ifneq ($(wildcard $(srctree)/arch/$(SRCARCH)/include/asm/kvm_par=
a.h \
> > >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0$(srctree)/include/asm-$(SRCA=
RCH)/kvm_para.h),)
> > >> header-y =A0+=3D kvm_para.h
> > >> endif
> > >>
> > >> but this doesn't seem to work.
> > >>
> > >> Kbuild people: which one is correct?
>=20
> Any use of wildcards in include/asm-generic/Kbuild.asm is bogus.
> We should:
> 1) add explicit header-y for kvm.h + a.out.h to the relevant architec=
tures.
> 2) add explicit header-y for kvm_para.h for the archictectures that n=
eeds this file
> 3) and drop header-y / dummy file fro the others.
>=20
> Anything else is just papering over the initial wrong doings.
>=20
> I actually coded up "header-n" support to explicitly say:
> do not include this file for this arch - but looking at the
> actual problem being solved this is just bogus so I killed
> it off again.

Just to be clear - I know this will break headers_check_all.
I will try to take a look soon for a better generic solution.

	Sam
--
To unsubscribe from this list: send the line "unsubscribe linux-kbuild"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
