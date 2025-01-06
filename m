Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA3BC8DF
	for <linux-m68k@lists.linux-m68k.org>; Mon,  6 Jan 2025 02:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736129449; cv=none; b=fxPCNQMSXSbub9RjU+OrKGBkaantn3CpPvU6pnEx7/eZiCoRIPr5tnzQEK6a1clITaXLmuPhlMXG3SCJ9CYf3n27sE4t2oVEDrnqpymBqzYYECdFmQdp8sxuL8lDdDH/TALW6NAlPe6beHJab7HOuR2dxpmiaQT2dED9fo0/mes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736129449; c=relaxed/simple;
	bh=KC2TrfrFdV0Z1LqfusoyvLixImP3Sm24U6q8RVUCrI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jux502T+So93c0CS2sWGdO5f3kOOxL9SDQZVyfQv6JwUuUHFF/m6zu2S9Pm6fqxbQK0uDTOSNIjFf6As/zFi0xzR+oiogfR+QK9ss9Wtge4CVts/PfK7YQHfQht47I1Y6NV79BchiIdMaWtsl1qCnZs0hyTQThNcTHSAfX9RuXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=pRFxtDjJ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="pRFxtDjJ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21636268e43so12021995ad.2
        for <linux-m68k@lists.linux-m68k.org>; Sun, 05 Jan 2025 18:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1736129446; x=1736734246; darn=lists.linux-m68k.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9CvLE9bpc4SqPvHkyNbD6gpUxVokrOE8W5s42r9PD5Q=;
        b=pRFxtDjJNq19SUiRTqshtiVN+LY8L9TBK6ykIURU+QY1n26EJAXYqJBE4y7Fy98A/F
         njr4AWu0Ia1MOBu63Uu5DNbq3qDHoT6MYee/UFLk9963736pSWn4gaqhHXwz/SIY3gTE
         ENzrf/rsD6dsXKUKZ5i3/Iy/QbrCOk3RMTe8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736129446; x=1736734246;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9CvLE9bpc4SqPvHkyNbD6gpUxVokrOE8W5s42r9PD5Q=;
        b=JaaOuCKXVaTD9oSTB/Fw/n4sa+xhQTqwezCICMCWRH4spIqj2z9h9jUs3VYWPxTE4z
         u+L0kfMobx5hl3VTQbWm2pxyYbmk43x5WsyK19Nq91ulJvE6SQMoiyYLFvDzSGwb+N7d
         taTBpXNczQksV1wayecCvgB5dRHYLw80bd8v8lieiOOjp+Vt1Y2VYOOppZxM2Bfo5MM0
         DA5a1VnIbt8b1XvykT12NZlMTSERhpXJDODaqW8dpd/jAbsuAbVm/uihi3bwj+r4eKFM
         9jWr7UsQLHl6YLsyJqGsxLpRRRLIHJNqT++yGpJyDZrtZDu8jTpdAH+ojGC3q7MdLMZT
         Rx5w==
X-Forwarded-Encrypted: i=1; AJvYcCX1LKDYAkxATzM1Nn8YIwkokeQjvFCsJuvPXrsUab+qfmc2TeMq7afXfcyagmNpB3eJqJRHtHTx7B6u@lists.linux-m68k.org
X-Gm-Message-State: AOJu0Yzp/QfLhysXbVN+zB36zkmzY3HUVSfQQVm+z3TYoGIY9XdcUbR6
	FR5KW04DIZ+eZigOw4XVb4RvEEUfApsaTalw0sAYFEB/MF6qeKsT25xQ5eOij0iDzlKhF9k9+NX
	Exrmqs1t4ZXStXX0KiN5FuQ/AU1nkF1iXhw4EEw==
X-Gm-Gg: ASbGncu9pnibjWGspKrZPAsK7pNmlxU4xkU3Gu1qzqA/B9tHEzgZrssntggxDFiGTaS
	Xb47K1y/Di7soQ8reHxhbycJnHSJH6wHHCxxtlYwONtYtYTusHvD+qxucCZB+ysGEjoyCZxQ=
X-Google-Smtp-Source: AGHT+IEgi9JttmpmCZn/QlUNGjOT5yxF3xgjDyPipA1MqOalWT/vq3nwMbwec4sV5is/VDCh5G2v6xR+agrKxjWNddg=
X-Received: by 2002:a05:6a21:998b:b0:1e0:b5ae:8fc1 with SMTP id
 adf61e73a8af0-1e5e0484570mr94020772637.13.1736129446122; Sun, 05 Jan 2025
 18:10:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250105071433.3943289-1-daniel@0x0f.com> <c0428d69-2f18-45d3-8024-a9fe4170b23e@kernel.org>
In-Reply-To: <c0428d69-2f18-45d3-8024-a9fe4170b23e@kernel.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Mon, 6 Jan 2025 11:10:34 +0900
Message-ID: <CAFr9PXnFi5FSsjMmuDPe6CtuyEa2bkDSiRZtVUPmYyXcmEuFkQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] m68k goes DT
To: Greg Ungerer <gerg@kernel.org>
Cc: geert@linux-m68k.org, fthain@linux-m68k.org, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000ebc8f6062b002279"

--000000000000ebc8f6062b002279
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

On Sun, 5 Jan 2025 at 23:59, Greg Ungerer <gerg@kernel.org> wrote:
> > - We initially add passing of an FDT via bootinfo for mmu
> > - Add support for a generic machine that can boot almost anything so I can
> >    bring up my new (to Linux) machines.
> > - I will migrate MVME147 to device tree.
> > - Some like minded person migrates a machine they have to device tree. :)
> > - Maybe embed a FDT for machines that'll never get a bootloader that
> >    supports this and use the machine type to select the embedded FDT
> >    and move all of that stuff over without needing to mess with bootloaders.
>
> To that end that is what I have been playing with. Doing it in a similar
> way to what MIPS does. Example patch attached of what I did for non-MMU
> ColdFire. So no boot loader support required.

Based on that I've attached what I think would work for normal 68k MMU.
Instead of manually embedding the DTB we embed all of them and if
there is no FDT in the bootinfo we use the builtin blob.
This allows booting without bootloader support and I can still pass a
custom FDT from u-boot to enable hardware connected to the VME
backplane.

Does this plan seem ok? If so I'll start the process of creating and
sending the dt bindings etc. I hate doing that stuff so I don't want
to do it if this is a no go. :)

Cheers,

Daniel

--000000000000ebc8f6062b002279
Content-Type: text/x-patch; charset="US-ASCII"; name="0001-m68k-dt-embedding.patch"
Content-Disposition: attachment; filename="0001-m68k-dt-embedding.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m5kebmeh0>
X-Attachment-Id: f_m5kebmeh0

RnJvbSBkOTU3ZGE1YzFhNzFjYTkxNzQzZjZiOTYyYTlhZGYwYzdmMDkzNjQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBEYW5pZWwgUGFsbWVyIDxkYW5pZWxAMHgwZi5jb20+CkRhdGU6
IE1vbiwgNiBKYW4gMjAyNSAxMDozNTowOCArMDkwMApTdWJqZWN0OiBbUEFUQ0hdIG02OGs6IGR0
IGVtYmVkZGluZwoKLS0tCiBhcmNoL202OGsvZHRzL01ha2VmaWxlICAgICAgICAgICB8ICAyICsr
CiBhcmNoL202OGsvZHRzL2VtYmVkZGVkX2R0YnMuUyAgICB8IDEyICsrKysrKysrKysrKwogYXJj
aC9tNjhrL2tlcm5lbC9zZXR1cF9tbS5jICAgICAgfCAxMSArKysrKysrKysrKwogYXJjaC9tNjhr
L2tlcm5lbC92bWxpbnV4LXN0ZC5sZHMgfCAgNiArKysrKysKIDQgZmlsZXMgY2hhbmdlZCwgMzEg
aW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvbTY4ay9kdHMvZW1iZWRkZWRf
ZHRicy5TCgpkaWZmIC0tZ2l0IGEvYXJjaC9tNjhrL2R0cy9NYWtlZmlsZSBiL2FyY2gvbTY4ay9k
dHMvTWFrZWZpbGUKaW5kZXggY2E0ZDY0YTczZjQ5Li5lMmNiNTNlNmQyZGIgMTAwNjQ0Ci0tLSBh
L2FyY2gvbTY4ay9kdHMvTWFrZWZpbGUKKysrIGIvYXJjaC9tNjhrL2R0cy9NYWtlZmlsZQpAQCAt
MSwzICsxLDUgQEAKICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAKIGR0Yi15ICs9
IFwKIAltdm1lMTQ3LmR0YgorCitvYmoteSArPSBlbWJlZGRlZF9kdGJzLm8KZGlmZiAtLWdpdCBh
L2FyY2gvbTY4ay9kdHMvZW1iZWRkZWRfZHRicy5TIGIvYXJjaC9tNjhrL2R0cy9lbWJlZGRlZF9k
dGJzLlMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi4xMzk4NTFlNzdi
MzkKLS0tIC9kZXYvbnVsbAorKysgYi9hcmNoL202OGsvZHRzL2VtYmVkZGVkX2R0YnMuUwpAQCAt
MCwwICsxLDEyIEBACisvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLworCisj
aW5jbHVkZSA8bGludXgvbGlua2FnZS5oPgorI2luY2x1ZGUgPGFzbS9wYWdlLmg+CisKKyAgICAg
ICAgLnNlY3Rpb24gIi5lbWJlZGRlZF9kdGJzIiwiYXciCisKKyAgICAgICAgLmJhbGlnbiBQQUdF
X1NJWkUKKworU1lNX0RBVEFfU1RBUlQobXZtZTE0N19kdGIpCisgICAgICAgIC5pbmNiaW4gImFy
Y2gvbTY4ay9kdHMvbXZtZTE0Ny5kdGIiCitTWU1fREFUQV9FTkRfTEFCRUwobXZtZTE0N19kdGIs
IFNZTV9MX0dMT0JBTCwgbXZtZTE0N19kdGJfZW5kKQpkaWZmIC0tZ2l0IGEvYXJjaC9tNjhrL2tl
cm5lbC9zZXR1cF9tbS5jIGIvYXJjaC9tNjhrL2tlcm5lbC9zZXR1cF9tbS5jCmluZGV4IDZkMzU4
MTI0MjU5ZS4uYTVmZWI1NjEwNjRkIDEwMDY0NAotLS0gYS9hcmNoL202OGsva2VybmVsL3NldHVw
X21tLmMKKysrIGIvYXJjaC9tNjhrL2tlcm5lbC9zZXR1cF9tbS5jCkBAIC0yOTMsNiArMjkzLDE3
IEBAIHZvaWQgX19pbml0IHNldHVwX2FyY2goY2hhciAqKmNtZGxpbmVfcCkKIAkJfQogCX0KIAor
CS8vIFRPRE86IFRoaXMgaXMgd3JvbmcsIHRoZSBibG9iIGlzIGluIHRoZSBpbml0IHNlY3Rpb24g
c28gaXQgbmVlZHMgdG8gYmUgY29waWVkCisJLy8gYnV0IFBvQworCWlmICghZmR0X2Jsb2IpCisJ
eworCQlleHRlcm4gdm9pZCAqbXZtZTE0N19kdGI7CisKKwkJcHJfaW5mbygiRkRUIGJsb2Igd2Fz
IG5vdCBwcm92aWRlZCwgd2lsbCB1c2UgZW1iZWRkZWQgb25lIGlmIGF2YWlsYWJsZVxuIik7CisJ
CWlmIChNQUNIX0lTX01WTUUxNDcpCisJCQlmZHRfYmxvYiA9IG12bWUxNDdfZHRiOworCX0KKwog
CWlmIChmZHRfYmxvYikKIAkJbTY4a19zZXR1cF9mZHQoKTsKIApkaWZmIC0tZ2l0IGEvYXJjaC9t
NjhrL2tlcm5lbC92bWxpbnV4LXN0ZC5sZHMgYi9hcmNoL202OGsva2VybmVsL3ZtbGludXgtc3Rk
LmxkcwppbmRleCAxY2NkZDA0YWU0NjIuLjNlNDBiNmNmMzZhNCAxMDA2NDQKLS0tIGEvYXJjaC9t
NjhrL2tlcm5lbC92bWxpbnV4LXN0ZC5sZHMKKysrIGIvYXJjaC9tNjhrL2tlcm5lbC92bWxpbnV4
LXN0ZC5sZHMKQEAgLTQzLDYgKzQzLDEyIEBAIFNFQ1RJT05TCiAgIF9faW5pdF9iZWdpbiA9IC47
CiAgIElOSVRfVEVYVF9TRUNUSU9OKFBBR0VfU0laRSkgOmRhdGEKICAgSU5JVF9EQVRBX1NFQ1RJ
T04oMTYpCisgIFNUUlVDVF9BTElHTigpOworICAuZW1iZWRkZWRfZHRicyA6IHsKKwllbWJlZGRl
ZF9kdGJzID0gLjsKKwkqKC5lbWJlZGRlZF9kdGJzKQorCUtFRVAoKiguZW1iZWRkZWRfZHRicykp
CisgIH0KICAgLm02OGtfZml4dXAgOiB7CiAJX19zdGFydF9maXh1cCA9IC47CiAJKigubTY4a19m
aXh1cCkKLS0gCjIuNDUuMgoK
--000000000000ebc8f6062b002279--
