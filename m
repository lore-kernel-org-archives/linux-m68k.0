From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH/RFC] m68k/bitops: Make bitmap data pointer of atomic ops volatile
Date: Tue, 7 Jun 2011 09:09:45 +0200
Message-ID: <BANLkTin8XNA+ocdjUhtzVOQNxOGFsYa1mA__29334.4536134557$1307430597$gmane$org@mail.gmail.com>
References: <1307390873-29687-1-git-send-email-geert@linux-m68k.org>
	<201106062211.15247.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <201106062211.15247.arnd@arndb.de>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-m68k@lists.linux-m68k.org, Akinobu Mita <akinobu.mita@gmail.com>, linux-kernel@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>, linux-ide@vger.kernel.org, dri-devel@lists.freedesktop.org

On Mon, Jun 6, 2011 at 22:11, Arnd Bergmann <arnd@arndb.de> wrote:
> On Monday 06 June 2011 22:07:53 Geert Uytterhoeven wrote:
>>
>> This fixes a.o.
>>
>> drivers/ide/ide-io.c: In function =E2=80=98ide_lock_host=E2=80=99:
>> drivers/ide/ide-io.c:415: warning: passing argument 2 of =E2=80=98__=
constant_test_and_set_bit=E2=80=99 discards qualifiers from pointer tar=
get type
>> drivers/ide/ide-io.c:415: warning: passing argument 2 of =E2=80=98__=
generic_test_and_set_bit=E2=80=99 discards qualifiers from pointer targ=
et type
>>
>> Suggested-by: Ben Hutchings <ben@decadent.org.uk>
>> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> I think the correct fix would be to mark the variable not volatile, a=
s it
> clearly has no business be marked as such. That doesn't mean your pat=
ch

You mean the host_busy variable in the IDE code?
That would also apply to context_flag in the DRM code:

drivers/gpu/drm/drm_context.c:233: warning: passing argument 2 of
=E2=80=98__constant_test_and_set_bit=E2=80=99 discards qualifiers from =
pointer target
type
drivers/gpu/drm/drm_context.c:233: warning: passing argument 2 of
=E2=80=98__generic_test_and_set_bit=E2=80=99 discards qualifiers from p=
ointer target
type

> is wrong, though. It probably doesn't hurt to do both.

asm-generic/bitops/atomic.h has the volatiles everywhere. That's why
I'm wondering.

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
