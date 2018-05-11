From: Phillip Susi <psusi-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Subject: Re: Atari label false positives
Date: Fri, 11 May 2018 11:56:36 -0400
Message-ID: <874bf955-d5bc-5d9c-0f87-445da67f3bdd@ubuntu.com>
References: <2d6f5455-963d-b044-a64d-67634df46071@ubuntu.com>
 <35ad9889-bc13-56bd-7831-f7bb3eea2d1e@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="6NUiuxUeEnBMGJtKOtaXH4xVoKdhOhaIO"
Return-path: <parted-devel-bounces+gcgpd-parted-devel=m.gmane.org-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org>
In-Reply-To: <35ad9889-bc13-56bd-7831-f7bb3eea2d1e-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org>
List-Unsubscribe: <https://alioth-lists.debian.net/cgi-bin/mailman/options/parted-devel>,
 <mailto:parted-devel-request-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org?subject=unsubscribe>
List-Archive: <http://alioth-lists.debian.net/pipermail/parted-devel/>
List-Post: <mailto:parted-devel-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org>
List-Help: <mailto:parted-devel-request-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org?subject=help>
List-Subscribe: <https://alioth-lists.debian.net/cgi-bin/mailman/listinfo/parted-devel>,
 <mailto:parted-devel-request-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org?subject=subscribe>
Errors-To: parted-devel-bounces+gcgpd-parted-devel=m.gmane.org-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org
Sender: "parted-devel"
 <parted-devel-bounces+gcgpd-parted-devel=m.gmane.org-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org>
To: John Paul Adrian Glaubitz <glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org>
Cc: Parted development <parted-devel-XbBxUvOt3X2LieD7tvxI8l/i77bcL1HB@public.gmane.org>, Linux/m68k <linux-m68k-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Debian m68k <debian-68k-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org>
List-Id: linux-m68k@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6NUiuxUeEnBMGJtKOtaXH4xVoKdhOhaIO
Content-Type: multipart/mixed; boundary="FImKjvtYK4ggp5eILYxyW1IMeNRM45dho";
 protected-headers="v1"
From: Phillip Susi <psusi-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
To: John Paul Adrian Glaubitz <glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org>
Cc: Debian m68k <debian-68k-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org>,
 Linux/m68k <linux-m68k-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>,
 Parted development <parted-devel-XbBxUvOt3X2LieD7tvxI8l/i77bcL1HB@public.gmane.org>
Message-ID: <874bf955-d5bc-5d9c-0f87-445da67f3bdd-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [parted-devel] Atari label false positives
References: <2d6f5455-963d-b044-a64d-67634df46071-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
 <35ad9889-bc13-56bd-7831-f7bb3eea2d1e-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org>
In-Reply-To: <35ad9889-bc13-56bd-7831-f7bb3eea2d1e-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org>

--FImKjvtYK4ggp5eILYxyW1IMeNRM45dho
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 5/11/2018 11:29 AM, John Paul Adrian Glaubitz wrote:
> Thanks for digging this up. I wasn't aware of this particular issue bef=
ore
> and I agree, this needs to be addressed. I hope that I didn't cause too=

> many DOS partitions to be misdetected. Sorry for the inconvenience if I=

> did. The Atari partition table code has been working great for
> Debian/m68k so
> far though.

I have seen at least one or two reports of Ubuntu users getting false
positives, and then I saw the bug report on the upstream parted bug
tracker the other day where someone claimed to have found a logical
error that caused atari_probe to return true when it shouldn't.  I
finally realized it was not an error ( at least I think not ).

I think I will at least move atari to be probed after all other labels
have failed.



--FImKjvtYK4ggp5eILYxyW1IMeNRM45dho--

--6NUiuxUeEnBMGJtKOtaXH4xVoKdhOhaIO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJa9b05AAoJENsuw7lhAP6ElqUH/1EKGllU+R1ZiuNw/7NSWU/y
7ghbzcLwWaInbQhJZ9DFJpVpUWvOpx4w0pDAa7lBFcICSwoY6UtqgUnFPOWduBKv
bpLXXWrt+vigegxuEHgGHz9aLNgLJdKknuUshkyZwowf5k3gr5oDQLpwRIjqu14E
70oHNMHRclH7d9G79jpkDcsXg9N0iCvoZMMMqfQqhBOn/73XcnkFM0Ica9/IGmhn
jJBjwdAR3W5q8IMw0cgx+30S8XYBkwoWvDK4+h0AJAYVGIi7uP1hW5CBmu7KpOQo
TU/pLppdqfzbQ/gbnKy2dek8x7ZwUVyftrXPOjd7xttm5ju/ouZy7YKl5/TXYFc=
=gOuN
-----END PGP SIGNATURE-----

--6NUiuxUeEnBMGJtKOtaXH4xVoKdhOhaIO--
