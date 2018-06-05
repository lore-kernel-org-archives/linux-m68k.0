From: Phillip Susi <psusi@ubuntu.com>
Subject: Re: [PATCH] Fix atari label false positives
Date: Tue, 5 Jun 2018 10:40:38 -0400
Message-ID: <208fded9-0bfc-0578-7a57-98b5c3af78dc@ubuntu.com>
References: <20180605143045.23875-1-psusi@ubuntu.com>
 <c21f382d-e788-a449-9865-23f50baf991a@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="oA2S4yvu6Z890hDinSeqO0ZgcLLCccSbP"
Return-path: <bounce-debian-68k=debian-68k=m.gmane.org@lists.debian.org>
In-Reply-To: <c21f382d-e788-a449-9865-23f50baf991a@physik.fu-berlin.de>
Resent-Message-ID: <jNE7U7uC0IC.A.hwH.NEqFbB@bendel>
List-URL: <https://lists.debian.org/debian-68k/>
List-Post: <mailto:debian-68k@lists.debian.org>
List-Help: <mailto:debian-68k-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-68k-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-68k-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/208fded9-0bfc-0578-7a57-98b5c3af78dc@ubuntu.com
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: parted-devel@lists.alioth.debian.org, linux-m68k@vger.kernel.org, debian-68k@lists.debian.org
List-Id: linux-m68k@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oA2S4yvu6Z890hDinSeqO0ZgcLLCccSbP
Content-Type: multipart/mixed; boundary="Zb67onaREBSahwwVKD4pvmbhDRBvr2s52";
 protected-headers="v1"
From: Phillip Susi <psusi@ubuntu.com>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: parted-devel@lists.alioth.debian.org, linux-m68k@vger.kernel.org,
 debian-68k@lists.debian.org
Message-ID: <208fded9-0bfc-0578-7a57-98b5c3af78dc@ubuntu.com>
Subject: Re: [PATCH] Fix atari label false positives
References: <20180605143045.23875-1-psusi@ubuntu.com>
 <c21f382d-e788-a449-9865-23f50baf991a@physik.fu-berlin.de>
In-Reply-To: <c21f382d-e788-a449-9865-23f50baf991a@physik.fu-berlin.de>

--Zb67onaREBSahwwVKD4pvmbhDRBvr2s52
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/5/2018 10:35 AM, John Paul Adrian Glaubitz wrote:
> Is that the reversed patch? I thought you wanted to move the atari
> probing to the bottom?

No; the order they are probed in is the reverse of the order they are
initialized in because the fs registration puts the new one on the head
and slides the previously registered ones further down.



--Zb67onaREBSahwwVKD4pvmbhDRBvr2s52--

--oA2S4yvu6Z890hDinSeqO0ZgcLLCccSbP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJbFqDsAAoJENsuw7lhAP6EEawIAJVlp/XFkG8dUyWiWbSGj/TT
HQvbcY7itj8qIv0em5TG49G2+Vy/iIdPmU37q9eWbwNbXMb8bKTvho54XVMFMIDj
GHYR3mrvWJjtm2y0qtnpDJXxRG6Kba2RHIprAoKC9g5+YgGzAZ3S6dFvg/tPCsuZ
oLJ7kN9A7/Na85a1mdOkVjJXOYzRlDgOTr3odJ+jtIwdPUSiy+cO7U5trzGc98oa
Ne0WQSQbsCsZFj3E7Gfqx283ALZebeEklktwka3+sHor9wXBXEgawpYJyr5OaJkq
DciykPCgp+XJ+aYc4XrHLJC13C5A7dFzze8HEsJ3SL/Nb2hCwiRn4OyyRlVcA+8=
=Qcu5
-----END PGP SIGNATURE-----

--oA2S4yvu6Z890hDinSeqO0ZgcLLCccSbP--
