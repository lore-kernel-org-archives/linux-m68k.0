From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: eliminate -pipe from kernel compile
Date: Wed, 13 May 2009 02:38:29 +0200
Message-ID: <20090513003829.GA13155@uranus.ravnborg.org>
References: <20090511015831.GB15777@luminet.net> <10f740e80905102302gbed0737y61c31900564ca704@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kbuild-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <10f740e80905102302gbed0737y61c31900564ca704@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: lancetag@luminet.net, linux-m68k@vger.kernel.org, linux-kbuild@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org

On Mon, May 11, 2009 at 08:02:16AM +0200, Geert Uytterhoeven wrote:
> Added linux-kbuild
>=20
> On Mon, May 11, 2009 at 03:58, Lance Tagliapietra <lancetag@luminet.n=
et> wrote:
> > I was noticing that kernel compiling is set up to have gcc pipe dat=
a from one pass to another, instead of using
> > temporary files. =A0On a memory constrained environment, this may n=
ot be the best idea (or at least I'd like to
> > explore that idea). =A0Instead of loading the assember, and having =
immediately being swapped out while the cc1 pass
> > runs, it may make more sense to have the temp files being written, =
instead of the swap in and out, when compiling
> > the various objects of the kernel.
> >
> > So, simply pulling out the -pipe from the compiler flag list didn't=
 see to have the desired effect. =A0I'm afraid I'm
> > still missing something. =A0I'm still observing the assembler being=
 loaded.

1) How did you "pulling out the -pipe from the compiler flag list"?
Please show this as a patch.

2) Did you verify that -pipe was used before and no more after your
   changes?
   Hint - use "make V=3D1" to see all command line options to gcc

	Sam
--
To unsubscribe from this list: send the line "unsubscribe linux-kbuild"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
