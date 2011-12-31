From: Thorsten Glaser <tg@mirbsd.de>
Subject: Re: [PATCH] aufs: Do not refer to AUFS_NAME in pr_fmt
Date: Sat, 31 Dec 2011 22:55:55 +0000 (UTC)
Message-ID: <Pine.BSM.4.64L.1112312254400.14351@herc.mirbsd.org>
References: <1325264773.13595.133.camel@deadeye> <Pine.BSM.4.64L.1112312202120.14351@herc.mirbsd.org>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="0-444052347-1325372179=:14351"
Return-path: <linux-m68k-owner@vger.kernel.org>
Received: from static-87-79-237-121.netcologne.de ([87.79.237.121]:46740 "EHLO
	herc.mirbsd.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753251Ab1LaW4m (ORCPT
	<rfc822;linux-m68k@vger.kernel.org>); Sat, 31 Dec 2011 17:56:42 -0500
In-Reply-To: <Pine.BSM.4.64L.1112312202120.14351@herc.mirbsd.org>
Sender: linux-m68k-owner@vger.kernel.org
List-Id: linux-m68k@vger.kernel.org
To: linux-m68k@vger.kernel.org
Cc: sfjro@users.sourceforge.net, aufs-users@lists.sourceforge.net, Debian kernel team <debian-kernel@lists.debian.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--0-444052347-1325372179=:14351
Content-Type: TEXT/PLAIN; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

Dixi quod=E2=80=A6

>This one does work:
>http://lists.debian.org/debian-kernel/2011/12/msg00474.html

Geert, would you please apply the attached patch, independent of
whether we are able to find a solution in aufs, as it avoids an
entire problem class?

Groeten uit Duitsland,
//mirabilos
--=20
[...] if maybe ext3fs wasn't a better pick, or jfs, or maybe reiserfs, oh b=
ut
what about xfs, and if only i had waited until reiser4 was ready... in the =
be-
ginning, there was ffs, and in the middle, there was ffs, and at the end, t=
here
was still ffs, and the sys admins knew it was good. :)  -- Ted Unangst =C3=
=BCber *fs
--0-444052347-1325372179=:14351
Content-Type: TEXT/PLAIN; charset=US-ASCII; name=0001-replace-inline-ack_bad_irq-with-a-block-macro-to-avo.patch
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.BSM.4.64L.1112312255550.14351@herc.mirbsd.org>
Content-Description: 
Content-Disposition: attachment; filename=0001-replace-inline-ack_bad_irq-with-a-block-macro-to-avo.patch

RnJvbSBmZGEyNTI5MzcxZjhjYzg4Nzk4NzdjYTNmM2ViOWRmYmFhZmI5NzU1
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KRnJvbTogVGhvcnN0ZW4gR2xh
c2VyIDx0Z0BtaXJic2Qub3JnPg0KRGF0ZTogU2F0LCAzMSBEZWMgMjAxMSAy
Mjo0ODo1MiArMDAwMA0KU3ViamVjdDogW1BBVENIXSByZXBsYWNlIGlubGlu
ZSBhY2tfYmFkX2lycSB3aXRoIGEgYmxvY2sgbWFjcm8gdG8gYXZvaWQgZXJy
b3INCiBwcm9wYWdhdGlvbg0KDQpJZiBhbnkgZmlsZSBpbmNsdWRpbmcgKGRp
cmVjdGx5IG9yIGluZGlyZWN0bHkpIGhhcmRpcnEuaCByZWRlZmluZXMNCnBy
X2ZtdCB0byBzb21ldGhpbmcgY29udGFpbmluZyBzb21lIHZhbHVlIG5vdCBh
dmFpbGFibGUgYXQgaGFyZGlycQ0KaW5jbHVzaW9uIHRpbWUsIGRlZmluaW5n
IGEgc3RhdGljIGlubGluZSBmdW5jdGlvbiBmYWlscywgd2hlcmVhcyBhDQpt
YWNybyBjYW4gYWx3YXlzIGJlIGRlZmluZWQgKGFuZCBuZWVkIG5vdCBldmVu
IGJlIGV4cGFuZGVkIG9uY2UgaW4NCnRoZSB0cmFuc2xhdGlvbiB1bml0IHdp
dGggcHJfZm10IHJlZGVmaW5lZCB3aGlsZSBhbGwgc3RhdGljIGlubGluZQ0K
ZnVuY3Rpb25zIHdpbGwgYWx3YXlzIGJlIGV4cGFuZGVkKS4NCg0KRml4ZXM6
IGh0dHA6Ly9saXN0cy5kZWJpYW4ub3JnL2RlYmlhbi1rZXJuZWwvMjAxMS8x
Mi9tc2cwMDQ3NC5odG1sDQoNClNpZ25lZC1vZmYtYnk6IFRob3JzdGVuIEds
YXNlciA8dGdAbWlyYnNkLm9yZz4NCi0tLQ0KIGFyY2gvbTY4ay9pbmNsdWRl
L2FzbS9oYXJkaXJxLmggfCAgICA4ICsrKystLS0tDQogMSBmaWxlcyBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQoNCmRpZmYg
LS1naXQgYS9hcmNoL202OGsvaW5jbHVkZS9hc20vaGFyZGlycS5oIGIvYXJj
aC9tNjhrL2luY2x1ZGUvYXNtL2hhcmRpcnEuaA0KaW5kZXggZGIzMGVkMi4u
YTJlMDBlNyAxMDA2NDQNCi0tLSBhL2FyY2gvbTY4ay9pbmNsdWRlL2FzbS9o
YXJkaXJxLmgNCisrKyBiL2FyY2gvbTY4ay9pbmNsdWRlL2FzbS9oYXJkaXJx
LmgNCkBAIC0xOCwxMCArMTgsMTAgQEANCiANCiAjaWZkZWYgQ09ORklHX01N
VQ0KIA0KLXN0YXRpYyBpbmxpbmUgdm9pZCBhY2tfYmFkX2lycSh1bnNpZ25l
ZCBpbnQgaXJxKQ0KLXsNCi0JcHJfY3JpdCgidW5leHBlY3RlZCBJUlEgdHJh
cCBhdCB2ZWN0b3IgJTAyeFxuIiwgaXJxKTsNCi19DQorI2RlZmluZSBhY2tf
YmFkX2lycShpcnEpIGRvIHsJCQkJCVwNCisJcHJfY3JpdCgidW5leHBlY3Rl
ZCBJUlEgdHJhcCBhdCB2ZWN0b3IgJTAyeFxuIiwJCVwNCisJICAgICh1bnNp
Z25lZCBpbnQpKGlycSkpOwkJCQlcDQorfSB3aGlsZSAoLyogQ09OU1RDT05E
ICovIDApDQogDQogLyogZW50cnkuUyBpcyBzZW5zaXRpdmUgdG8gdGhlIG9m
ZnNldHMgb2YgdGhlc2UgZmllbGRzICovDQogdHlwZWRlZiBzdHJ1Y3Qgew0K
LS0gDQoxLjcuNy4zDQoNCg==

--0-444052347-1325372179=:14351--
