From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH/RFC] m68k/bitops: Make bitmap data pointer of atomic ops volatile
Date: Mon, 6 Jun 2011 22:11:15 +0200
Message-ID: <201106062211.15247.arnd@arndb.de>
References: <1307390873-29687-1-git-send-email-geert@linux-m68k.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-m68k-owner@vger.kernel.org>
In-Reply-To: <1307390873-29687-1-git-send-email-geert@linux-m68k.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, Akinobu Mita <akinobu.mita@gmail.com>, linux-kernel@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>

On Monday 06 June 2011 22:07:53 Geert Uytterhoeven wrote:
>=20
> This fixes a.o.
>=20
> drivers/ide/ide-io.c: In function =E2=80=98ide_lock_host=E2=80=99:
> drivers/ide/ide-io.c:415: warning: passing argument 2 of =E2=80=98__c=
onstant_test_and_set_bit=E2=80=99 discards qualifiers from pointer targ=
et type
> drivers/ide/ide-io.c:415: warning: passing argument 2 of =E2=80=98__g=
eneric_test_and_set_bit=E2=80=99 discards qualifiers from pointer targe=
t type
>=20
> Suggested-by: Ben Hutchings <ben@decadent.org.uk>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

I think the correct fix would be to mark the variable not volatile, as =
it
clearly has no business be marked as such. That doesn't mean your patch
is wrong, though. It probably doesn't hurt to do both.

	Arnd
