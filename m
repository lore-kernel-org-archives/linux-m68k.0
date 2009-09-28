From: mike <localgost@gmail.com>
Subject: Re: toolchain, was Re: bogl: don't know screen type 1
Date: Mon, 28 Sep 2009 16:00:55 +0200
Message-ID: <8259f0250909280700p7c28e82cye8b507d42427df25@mail.gmail.com>
References: <8259f0250908302028n9b0cb56td402539007736fce@mail.gmail.com>
	 <8259f0250908311511h77270544vb2dc3dd383f1add8@mail.gmail.com>
	 <8259f0250908311516r49e54c7fi44ead0f040cade30@mail.gmail.com>
	 <20090901151747.GB27514@marenka.net>
	 <alpine.OSX.2.00.0909050045330.383@silk.local>
	 <4AA2684E.1080009@codesourcery.com>
	 <alpine.LNX.2.00.0909122039160.6219@nippy.intranet>
	 <4AAC7CB6.2060400@codesourcery.com>
	 <alpine.LNX.2.00.0909141827440.25347@nippy.intranet>
	 <8259f0250909212211l6f4dd00aue3a648f1166ba582@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from mail-ew0-f211.google.com ([209.85.219.211]:50535 "EHLO
	mail-ew0-f211.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751202AbZI1OAw convert rfc822-to-8bit (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Mon, 28 Sep 2009 10:00:52 -0400
Received: by ewy7 with SMTP id 7so4447571ewy.17
        for <linux-m68k@vger.kernel.org>; Mon, 28 Sep 2009 07:00:55 -0700 (PDT)
In-Reply-To: <8259f0250909212211l6f4dd00aue3a648f1166ba582@mail.gmail.com>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: fthain@telegraphics.com.au
Cc: Maxim Kuvyrkov <maxim@codesourcery.com>, linux-m68k@vger.kernel.org, debian-68k@lists.debian.org

Ok, i've nearly finished my manual install of 3.1r8...
I've got two problems, im missing
/lib/modules/2.4.27-amiga/modules.dep ( does anyone have it handy? )

And a "passwd: Authentication token manipulation error"
I've checked the perms of /etc/shadow they are shadow root and correct
rw. so is passwd

And i can so far only boot into single user mode. But that will work fo=
r now.

-Mike

2009/9/22 mike <localgost@gmail.com>:
> Seems im not the only soul feeling the bloat
> http://news.cnet.com/8301-13505_3-10358024-16.html
>
> I havent seen any 68k linux benchmarks for this yet
> http://cshandley.co.uk/temp/membench/
> http://amigaworld.net/modules/newbb/viewtopic.php?topic_id=3D29569&fo=
rum=3D14
>
> It would be interesting if someone could compare a binary compiled
> with gcc 2.95 to 3.33 3.40 and or 4.4 for linux, on various systems
> even. To see if the slowdown has any consistency.
>
> -Mike
>
>
> 2009/9/14 =C2=A0<fthain@telegraphics.com.au>:
>>
>> On Sun, 13 Sep 2009, Maxim Kuvyrkov wrote:
>>
>>> fthain@telegraphics.com.au wrote:
>>>
>>> > On Sat, 5 Sep 2009, Maxim Kuvyrkov wrote:
>>> >
>>> > > Finn Thain wrote: ...
>>> > >
>>> > > > I understand that the current GCC (4.4) lacks the necessary
>>> > > > patches, and 4.5 is still uncooked (and that's a scary prospe=
ct).
>>> > > > Can someone confirm that this is the necessary patch for 4.4:
>>> > > > http://gcc.gnu.org/ml/gcc-patches/2009-05/msg01024.html
>>> > > I think GCC 4.4 should be good enough.
>>> >
>>> > I tried patching 4.4.1 and the patch was rejected. It expects
>>> > m68k_legitimize_address() to have been declared and defined, but =
that
>>> > routine isn't in gcc-4.4.
>>>
>>> m68k.c:m68k_legitimize_address() was macro m68k.h:LEGITIMIZE_ADDRES=
S(),
>>> you need to move the hunk to m68k.h.
>>>
>>
>> Thanks for the tip.
>>
>> Here's a second cut. This one removes the m68k_tls_symbol_p() routin=
e and
>> inlines that logic in the LEGITIMIZE_ADDRESS macro (avoids a referen=
ce to
>> m68k_tls_symbol_p() from explow.o). The TARGET_HAVE_TLS macro wasn't
>> defined in explow.c so I changed it to HAVE_AS_TLS.
>>
>> It appears to work, but I won't be able to test any binary produced =
by
>> this compiler for a week or so.
>>
>> Finn
>>
>>
>> --- gcc-m68k-support-for-tls.patch =C2=A0 =C2=A0 =C2=A02009-09-14 15=
:11:39.893286532 +1000
>> +++ gcc-m68k-support-for-tls-backport.patch =C2=A0 =C2=A0 2009-09-14=
 15:11:34.563287784 +1000
>> @@ -574,13 +574,7 @@
>>
>> =C2=A0enum reg_class regno_reg_class[] =3D
>> =C2=A0{
>> -@@ -143,11 +144,13 @@ static tree m68k_handle_fndecl_attribute
>> - static void m68k_compute_frame_layout (void);
>> - static bool m68k_save_reg (unsigned int regno, bool interrupt_hand=
ler);
>> - static bool m68k_ok_for_sibcall_p (tree, tree);
>> -+static bool m68k_tls_symbol_p (rtx);
>> - static rtx m68k_legitimize_address (rtx, rtx, enum machine_mode);
>> - static bool m68k_rtx_costs (rtx, int, int, int *, bool);
>> +@@ -146,6 +147,7 @@ static tree m68k_handle_fndecl_attribute
>> =C2=A0#if M68K_HONOR_TARGET_STRICT_ALIGNMENT
>> =C2=A0static bool m68k_return_in_memory (const_tree, const_tree);
>> =C2=A0#endif
>> @@ -613,16 +607,6 @@
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0&& crtl->uses_pic_offset_table)
>> =C2=A0 =C2=A0 =C2=A0insn =3D emit_insn (gen_load_got (pic_offset_tab=
le_rtx));
>> =C2=A0}
>> -@@ -1431,6 +1441,9 @@ m68k_legitimize_sibcall_address (rtx x)
>> - rtx
>> - m68k_legitimize_address (rtx x, rtx oldx, enum machine_mode mode)
>> - {
>> -+ =C2=A0if (m68k_tls_symbol_p (x))
>> -+ =C2=A0 =C2=A0return m68k_legitimize_tls_address (x);
>> -+
>> - =C2=A0 if (GET_CODE (x) =3D=3D PLUS)
>> - =C2=A0 =C2=A0 {
>> - =C2=A0 =C2=A0 =C2=A0 int ch =3D (x) !=3D (oldx);
>> =C2=A0@@ -1849,7 +1862,7 @@ m68k_illegitimate_symbolic_constant_p (r
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&& !offset_within_block_p (base, I=
NTVAL (offset)))
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;
>> @@ -957,7 +941,7 @@
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0return orig;
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0gcc_assert (reg);
>> -@@ -2196,13 +2421,257 @@ legitimize_pic_address (rtx orig, enum m
>> +@@ -2196,13 +2421,244 @@ legitimize_pic_address (rtx orig, enum m
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base =3D=3D re=
g ? 0 : reg);
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (GET_CODE (orig) =3D=3D CONST_INT)
>> @@ -1164,19 +1148,6 @@
>> =C2=A0+ =C2=A0return orig;
>> =C2=A0+}
>> =C2=A0+
>> -+/* Return true if X is a TLS symbol. =C2=A0*/
>> -+
>> -+static bool
>> -+m68k_tls_symbol_p (rtx x)
>> -+{
>> -+ =C2=A0if (!TARGET_HAVE_TLS)
>> -+ =C2=A0 =C2=A0return false;
>> -+
>> -+ =C2=A0if (GET_CODE (x) !=3D SYMBOL_REF)
>> -+ =C2=A0 =C2=A0return false;
>> -+
>> -+ =C2=A0return SYMBOL_REF_TLS_MODEL (x) !=3D 0;
>> -+}
>> =C2=A0+
>> =C2=A0+/* Helper for m68k_tls_referenced_p. =C2=A0*/
>> =C2=A0+
>> @@ -1414,6 +1385,18 @@
>>
>> =C2=A0#define REG_OK_FOR_BASE_P(X) \
>> =C2=A0 =C2=A0m68k_legitimate_base_reg_p (X, REG_STRICT_P)
>> +@@ -777,7 +778,10 @@ __transfer_from_trampoline () =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> + #define COPY_ONCE(Y) if (!copied) { Y =3D copy_rtx (Y); copied =3D=
 ch =3D 1; }
>> + #define LEGITIMIZE_ADDRESS(X,OLDX,MODE,WIN) =C2=A0 \
>> + { register int ch =3D (X) !=3D (OLDX); =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> +- =C2=A0if (GET_CODE (X) =3D=3D PLUS) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> ++ =C2=A0if (HAVE_AS_TLS && (GET_CODE (X) =3D=3D SYMBOL_REF) && =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> ++ =C2=A0 =C2=A0 =C2=A0(SYMBOL_REF_TLS_MODEL (X) !=3D 0)) =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> ++ =C2=A0 =C2=A0m68k_legitimize_tls_address (X); =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> ++ =C2=A0else if (GET_CODE (X) =3D=3D PLUS) =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> + =C2=A0 =C2=A0 { int copied =3D 0; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> + =C2=A0 =C2=A0 =C2=A0 if (GET_CODE (XEXP (X, 0)) =3D=3D MULT) =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 \
>> + =C2=A0 =C2=A0 =C2=A0 { COPY_ONCE (X); XEXP (X, 0) =3D force_operan=
d (XEXP (X, 0), 0);} \
>> =C2=A0@@ -974,6 +975,9 @@ do { if (cc_prev_status.flags & CC_IN_68
>> =C2=A0 =C2=A0assemble_name ((FILE), (NAME)), =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \
>> =C2=A0 =C2=A0fprintf ((FILE), ",%u\n", (int)(ROUNDED)))
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-m68k=
" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.h=
tml
>>
>
--
To unsubscribe from this list: send the line "unsubscribe linux-m68k" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
