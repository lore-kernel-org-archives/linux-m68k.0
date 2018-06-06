From: Phillip Susi <psusi-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] Fix atari label false positives
Date: Wed, 6 Jun 2018 09:14:09 -0400
Message-ID: <5f780c27-97f5-a42f-77c1-65c3b7b52078@ubuntu.com>
References: <20180605143045.23875-1-psusi@ubuntu.com>
 <CAACXqO8f-=-Bj6JiddnQM5GMFenDUj-MBO7ZTUcPh1tAKWtTmQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FankngdQdn2Ramim7Y41p3Gh68HOnkQIq"
Return-path: <parted-devel-bounces+gcgpd-parted-devel=m.gmane.org-wVTzQnVv9Y8Rm1jG9FmulZdwIE86Xf0q@public.gmane.org>
In-Reply-To: <CAACXqO8f-=-Bj6JiddnQM5GMFenDUj-MBO7ZTUcPh1tAKWtTmQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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
To: =?UTF-8?B?SMOla29uIEzDuHZkYWw=?= <hlovdal-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: GNU Parted developers' list <parted-devel-XbBxUvOt3X2LieD7tvxI8l/i77bcL1HB@public.gmane.org>, linux-m68k-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, debian-68k-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org
List-Id: linux-m68k@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FankngdQdn2Ramim7Y41p3Gh68HOnkQIq
Content-Type: multipart/mixed; boundary="XMRhAI4fQKF9f5epFXkB2yIzACKmoTJCp";
 protected-headers="v1"
From: Phillip Susi <psusi-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
To: =?UTF-8?B?SMOla29uIEzDuHZkYWw=?= <hlovdal-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: glaubitz-1Olz3AKvcsuAKZTfuerNgRvVK+yQ3ZXh@public.gmane.org, debian-68k-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org,
 linux-m68k-u79uwXL29TY76Z2rM5mHXA@public.gmane.org,
 GNU Parted developers' list <parted-devel-XbBxUvOt3X2LieD7tvxI8l/i77bcL1HB@public.gmane.org>
Message-ID: <5f780c27-97f5-a42f-77c1-65c3b7b52078-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [parted-devel] [PATCH] Fix atari label false positives
References: <20180605143045.23875-1-psusi-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
 <CAACXqO8f-=-Bj6JiddnQM5GMFenDUj-MBO7ZTUcPh1tAKWtTmQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
In-Reply-To: <CAACXqO8f-=-Bj6JiddnQM5GMFenDUj-MBO7ZTUcPh1tAKWtTmQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>

--XMRhAI4fQKF9f5epFXkB2yIzACKmoTJCp
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 6/5/2018 4:08 PM, H=C3=A5kon L=C3=B8vdal wrote:
> While the commit message contains the relevant information, this really=

> ought to be present as a comment directly in the code as well. And
> the un-obviousness of the code vs check order deserves a mention as
> well, so please add a commen like
>=20
> +       ped_disk_atari_init (); // NB! Must be first so that it is chec=
ked last.

Will do.


--XMRhAI4fQKF9f5epFXkB2yIzACKmoTJCp--

--FankngdQdn2Ramim7Y41p3Gh68HOnkQIq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJbF94kAAoJENsuw7lhAP6EAGQH/1DA7tnNakAXMrskycK/DoAq
V0JMxh1QXieKwipKdU40yGWRa+7OzGN+Tqd+iwYSCBKBN40kwLZqVIlcDoBvvcyr
p7mBeyYQ+WUxMCN2Y/xphP1ssvYXVSVEMZ+TMaqzLocBAtskT8JWKpX+8sWBCCWg
rHT3NUJG/qeCdnHCO6m86Qjhfo0u59Jxk2aktQAVSZR8z9QQX9ZXa67mWu4vkewJ
6RQawrNWeB5GG+nJvchCyu2077S/AjnYqjIIL9vbOevhnMXhOHjq7nKmNyR2bP4S
hBT1johTNggVmhaLUM8JXqpCx7GtuCfjAnk1/G/BVKWCaivTVTQDVexbCuQp8bo=
=Jf7K
-----END PGP SIGNATURE-----

--FankngdQdn2Ramim7Y41p3Gh68HOnkQIq--
