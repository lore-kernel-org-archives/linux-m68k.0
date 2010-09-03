From: Finn Thain <fthain@telegraphics.com.au>
Subject: Re: Fwd: [PATCH 36/91] arch/m68k/mac/macboing.c Update broken web
 addresses in the arch directory.
Date: Fri, 3 Sep 2010 18:20:14 +1000 (EST)
Message-ID: <alpine.OSX.2.00.1009031809380.344@localhost>
References: <1283461746-7905-1-git-send-email-justinmattock@gmail.com> <1283461746-7905-6-git-send-email-justinmattock@gmail.com> <AANLkTikTeznNoS0CMEpMe+mJKgrjpsGf-z798vA0chbB@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="0-558927961-1283501359=:344"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from www.telegraphics.com.au ([204.15.192.19]:55143 "EHLO
	mail.telegraphics.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754083Ab0ICIaB (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Fri, 3 Sep 2010 04:30:01 -0400
In-Reply-To: <AANLkTikTeznNoS0CMEpMe+mJKgrjpsGf-z798vA0chbB@mail.gmail.com>
Content-ID: <alpine.OSX.2.00.1009031818120.344@localhost>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux/m68k <linux-m68k@vger.kernel.org>, "Justin P. Mattock" <justinmattock@gmail.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-558927961-1283501359=:344
Content-Type: TEXT/PLAIN; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <alpine.OSX.2.00.1009031818121.344@localhost>


These TIL articles are still around, and removing the article number from=
=20
the source code is doing it damage.

(I'm guessing that this change to human readable text was suggested by a=20
machine...)

I checked on archive.org for the URL, which lead me to=20
http://kbase.info.apple.com/
Searching the archives there for article 16405 leads to=20
http://support.apple.com/kb/TA32601
If there's a patch required (doubtful) then that's the new URL.

Patched or not, the original TIL number needs to be retained in the=20
comment, since those TIL articles are also in the materials Apple has sent=
=20
to developers over the decades, which are indexed that way.

Finn


On Fri, 3 Sep 2010, Geert Uytterhoeven wrote:

> linux-alpha was the wrong list?
>=20
> ---------- Forwarded message ----------
> From: Justin P. Mattock <justinmattock@gmail.com>
> Date: Thu, Sep 2, 2010 at 23:08
> Subject: [PATCH 36/91] arch/m68k/mac/macboing.c Update broken web
> addresses in the arch directory.
> To: trivial@kernel.org
> Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
> jkosina@suse.cz, "Justin P. Mattock" <justinmattock@gmail.com>
>=20
>=20
> The below patch updates a broken web address that is no longer
> working due to company buyout, and/or change of location.
> (Please have a look through, and let me know if any of them
> need to be changed, and I'll resend an updated patch).
>=20
> Signed-off-by: Justin P. Mattock <justinmattock@gmail.com>
>=20
> ---
> =A0arch/m68k/mac/macboing.c | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/arch/m68k/mac/macboing.c b/arch/m68k/mac/macboing.c
> index 8f06408..e1e3377 100644
> --- a/arch/m68k/mac/macboing.c
> +++ b/arch/m68k/mac/macboing.c
> @@ -114,7 +114,7 @@ static void mac_init_asc( void )
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * =A0 16-bit I/O function=
ality. =A0The PowerBook
> 500 series computers
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * =A0 support 16-bit ster=
eo output, but only mono input."
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*
> http://til.info.apple.com/techinfo.nsf/artnum/n16405
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* =A0 http://www.apple.c=
om/
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 * --David Kilzer
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 */
> --
> 1.7.2.1
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" i=
n
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
>=20
>=20
>=20
>=20
--0-558927961-1283501359=:344--
