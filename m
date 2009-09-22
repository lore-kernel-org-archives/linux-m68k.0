From: Geert Uytterhoeven <geert.uytterhoeven@gmail.com>
Subject: Re: benchmarks, was Re: toolchain
Date: Tue, 22 Sep 2009 17:08:48 +0200
Message-ID: <10f740e80909220808g684313fh9fa5aa9df55dbf95@mail.gmail.com>
References: <8259f0250908302028n9b0cb56td402539007736fce@mail.gmail.com>
	 <20090901151747.GB27514@marenka.net>
	 <alpine.OSX.2.00.0909050045330.383@silk.local>
	 <4AA2684E.1080009@codesourcery.com>
	 <alpine.LNX.2.00.0909122039160.6219@nippy.intranet>
	 <4AAC7CB6.2060400@codesourcery.com>
	 <alpine.LNX.2.00.0909141827440.25347@nippy.intranet>
	 <8259f0250909212211l6f4dd00aue3a648f1166ba582@mail.gmail.com>
	 <alpine.OSX.2.00.0909222258220.414@silk.local>
	 <8259f0250909220751q5db44b83v3fd440e65cdc96e3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-pz0-f173.google.com ([209.85.222.173]:45208 "EHLO
	mail-pz0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756776AbZIVPIo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Tue, 22 Sep 2009 11:08:44 -0400
Received: by pzk3 with SMTP id 3so3001915pzk.20
        for <linux-m68k@vger.kernel.org>; Tue, 22 Sep 2009 08:08:48 -0700 (PDT)
In-Reply-To: <8259f0250909220751q5db44b83v3fd440e65cdc96e3@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: mike <localgost@gmail.com>
Cc: Finn Thain <fthain@telegraphics.com.au>, linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

On Tue, Sep 22, 2009 at 16:51, mike <localgost@gmail.com> wrote:
>> These benchmarks aren't for linux, right?
> Nope, thats amiga c
> I see umisef made a mac version , but i cant see a link to it anywher=
e.
>
>
> For some reason, probably due to the way amigaos 3.9 has configured
> the hd i cant mount, or read SFS partitions from linux, so im dead in

Linux can't read SFS/PFS.

> Are there any other VM's i could use to install linux 68k?

ARAnyM?

> 2009/9/22 Finn Thain <fthain@telegraphics.com.au>:
>>
>>
>> On Tue, 22 Sep 2009, mike wrote:
>>
>>> Seems im not the only soul feeling the bloat
>>> http://news.cnet.com/8301-13505_3-10358024-16.html
>>>
>>> I havent seen any 68k linux benchmarks for this yet
>>> http://cshandley.co.uk/temp/membench/
>>> http://amigaworld.net/modules/newbb/viewtopic.php?topic_id=3D29569&=
forum=3D14
>>
>> These benchmarks aren't for linux, right?
>>
>>>
>>> It would be interesting if someone could compare a binary compiled =
with
>>> gcc 2.95 to 3.33 3.40 and or 4.4 for linux, on various systems even=
=2E To
>>> see if the slowdown has any consistency.
>>
>> If you would like to run some linux benchmarks, I could build the la=
test
>> kernel using several different compilers for you. I'd need a kernel =
config
>> to suit your hardware though.
>>
>> But if you want to compare different compilers using benchmarks for =
a
>> different operating system, I can't help with that. You may have mor=
e luck
>> with that on the relevant mailing list or forum.
>>
>> Finn
>>
>>>
>>> -Mike
>>>
>>>
>>> 2009/9/14 =C2=A0<fthain@telegraphics.com.au>:
>>> >
>>> > On Sun, 13 Sep 2009, Maxim Kuvyrkov wrote:
>>> >
>>> >> fthain@telegraphics.com.au wrote:
>>> >>
>>> >> > On Sat, 5 Sep 2009, Maxim Kuvyrkov wrote:
>>> >> >
>>> >> > > Finn Thain wrote: ...
>>> >> > >
>>> >> > > > I understand that the current GCC (4.4) lacks the necessar=
y
>>> >> > > > patches, and 4.5 is still uncooked (and that's a scary pro=
spect).
>>> >> > > > Can someone confirm that this is the necessary patch for 4=
=2E4:
>>> >> > > > http://gcc.gnu.org/ml/gcc-patches/2009-05/msg01024.html
>>> >> > > I think GCC 4.4 should be good enough.
>>> >> >
>>> >> > I tried patching 4.4.1 and the patch was rejected. It expects
>>> >> > m68k_legitimize_address() to have been declared and defined, b=
ut that
>>> >> > routine isn't in gcc-4.4.
>>> >>
>>> >> m68k.c:m68k_legitimize_address() was macro m68k.h:LEGITIMIZE_ADD=
RESS(),
>>> >> you need to move the hunk to m68k.h.
>>> >>
>>> >
>>> > Thanks for the tip.
>>> >
>>> > Here's a second cut. This one removes the m68k_tls_symbol_p() rou=
tine and
>>> > inlines that logic in the LEGITIMIZE_ADDRESS macro (avoids a refe=
rence to
>>> > m68k_tls_symbol_p() from explow.o). The TARGET_HAVE_TLS macro was=
n't
>>> > defined in explow.c so I changed it to HAVE_AS_TLS.
>>> >
>>> > It appears to work, but I won't be able to test any binary produc=
ed by
>>> > this compiler for a week or so.
>>> >
>>> > Finn
>>> >
>>> >
>>> > --- gcc-m68k-support-for-tls.patch =C2=A0 =C2=A0 =C2=A02009-09-14=
 15:11:39.893286532 +1000
>>> > +++ gcc-m68k-support-for-tls-backport.patch =C2=A0 =C2=A0 2009-09=
-14 15:11:34.563287784 +1000
>>> > @@ -574,13 +574,7 @@
>>> >
>>> > =C2=A0enum reg_class regno_reg_class[] =3D
>>> > =C2=A0{
>>> > -@@ -143,11 +144,13 @@ static tree m68k_handle_fndecl_attribute
>>> > - static void m68k_compute_frame_layout (void);
>>> > - static bool m68k_save_reg (unsigned int regno, bool interrupt_h=
andler);
>>> > - static bool m68k_ok_for_sibcall_p (tree, tree);
>>> > -+static bool m68k_tls_symbol_p (rtx);
>>> > - static rtx m68k_legitimize_address (rtx, rtx, enum machine_mode=
);
>>> > - static bool m68k_rtx_costs (rtx, int, int, int *, bool);
>>> > +@@ -146,6 +147,7 @@ static tree m68k_handle_fndecl_attribute
>>> > =C2=A0#if M68K_HONOR_TARGET_STRICT_ALIGNMENT
>>> > =C2=A0static bool m68k_return_in_memory (const_tree, const_tree);
>>> > =C2=A0#endif
>>> > @@ -613,16 +607,6 @@
>>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0&& crtl->uses_pic_offset_table)
>>> > =C2=A0 =C2=A0 =C2=A0insn =3D emit_insn (gen_load_got (pic_offset_=
table_rtx));
>>> > =C2=A0}
>>> > -@@ -1431,6 +1441,9 @@ m68k_legitimize_sibcall_address (rtx x)
>>> > - rtx
>>> > - m68k_legitimize_address (rtx x, rtx oldx, enum machine_mode mod=
e)
>>> > - {
>>> > -+ =C2=A0if (m68k_tls_symbol_p (x))
>>> > -+ =C2=A0 =C2=A0return m68k_legitimize_tls_address (x);
>>> > -+
>>> > - =C2=A0 if (GET_CODE (x) =3D=3D PLUS)
>>> > - =C2=A0 =C2=A0 {
>>> > - =C2=A0 =C2=A0 =C2=A0 int ch =3D (x) !=3D (oldx);
>>> > =C2=A0@@ -1849,7 +1862,7 @@ m68k_illegitimate_symbolic_constant_p=
 (r
>>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&& !offset_within_block_p (base=
, INTVAL (offset)))
>>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;
>>> > @@ -957,7 +941,7 @@
>>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0return orig;
>>> >
>>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc_assert (reg);
>>> > -@@ -2196,13 +2421,257 @@ legitimize_pic_address (rtx orig, enum =
m
>>> > +@@ -2196,13 +2421,244 @@ legitimize_pic_address (rtx orig, enum =
m
>>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base =3D=3D=
 reg ? 0 : reg);
>>> >
>>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0if (GET_CODE (orig) =3D=3D CONST_INT)
>>> > @@ -1164,19 +1148,6 @@
>>> > =C2=A0+ =C2=A0return orig;
>>> > =C2=A0+}
>>> > =C2=A0+
>>> > -+/* Return true if X is a TLS symbol. =C2=A0*/
>>> > -+
>>> > -+static bool
>>> > -+m68k_tls_symbol_p (rtx x)
>>> > -+{
>>> > -+ =C2=A0if (!TARGET_HAVE_TLS)
>>> > -+ =C2=A0 =C2=A0return false;
>>> > -+
>>> > -+ =C2=A0if (GET_CODE (x) !=3D SYMBOL_REF)
>>> > -+ =C2=A0 =C2=A0return false;
>>> > -+
>>> > -+ =C2=A0return SYMBOL_REF_TLS_MODEL (x) !=3D 0;
>>> > -+}
>>> > =C2=A0+
>>> > =C2=A0+/* Helper for m68k_tls_referenced_p. =C2=A0*/
>>> > =C2=A0+
>>> > @@ -1414,6 +1385,18 @@
>>> >
>>> > =C2=A0#define REG_OK_FOR_BASE_P(X) \
>>> > =C2=A0 =C2=A0m68k_legitimate_base_reg_p (X, REG_STRICT_P)
>>> > +@@ -777,7 +778,10 @@ __transfer_from_trampoline () =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>>> > + #define COPY_ONCE(Y) if (!copied) { Y =3D copy_rtx (Y); copied =
=3D ch =3D 1; }
>>> > + #define LEGITIMIZE_ADDRESS(X,OLDX,MODE,WIN) =C2=A0 \
>>> > + { register int ch =3D (X) !=3D (OLDX); =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>>> > +- =C2=A0if (GET_CODE (X) =3D=3D PLUS) =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>>> > ++ =C2=A0if (HAVE_AS_TLS && (GET_CODE (X) =3D=3D SYMBOL_REF) && =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>>> > ++ =C2=A0 =C2=A0 =C2=A0(SYMBOL_REF_TLS_MODEL (X) !=3D 0)) =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>>> > ++ =C2=A0 =C2=A0m68k_legitimize_tls_address (X); =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>>> > ++ =C2=A0else if (GET_CODE (X) =3D=3D PLUS) =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>>> > + =C2=A0 =C2=A0 { int copied =3D 0; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>>> > + =C2=A0 =C2=A0 =C2=A0 if (GET_CODE (XEXP (X, 0)) =3D=3D MULT) =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 \
>>> > + =C2=A0 =C2=A0 =C2=A0 { COPY_ONCE (X); XEXP (X, 0) =3D force_ope=
rand (XEXP (X, 0), 0);} \
>>> > =C2=A0@@ -974,6 +975,9 @@ do { if (cc_prev_status.flags & CC_IN_6=
8
>>> > =C2=A0 =C2=A0assemble_name ((FILE), (NAME)), =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 \
>>> > =C2=A0 =C2=A0fprintf ((FILE), ",%u\n", (int)(ROUNDED)))
>>> > --
>>> > To unsubscribe from this list: send the line "unsubscribe linux-m=
68k" in
>>> > the body of a message to majordomo@vger.kernel.org
>>> > More majordomo info at =C2=A0http://vger.kernel.org/majordomo-inf=
o.html
>>> >
>>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-m68k"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>



--=20
Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
							    -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
