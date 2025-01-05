Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D93E143C5D
	for <linux-m68k@lists.linux-m68k.org>; Sun,  5 Jan 2025 14:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.178.84.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736089152; cv=none; b=bNn/a+JMwri80GvEytXrV0XfX8bhbQre8b5otxAy5b0kGJHuycBNv9WFRCbBibBHMOEMiYkxpJ6JUqCawh/jrXRgt4heEPNVtlySmQtxlyOA5q/awYS+gjLMxk+F0tONSSS51VdFgQQS/PEP4y6mLl2C0HSsiwoKy5NjKbQzd60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736089152; c=relaxed/simple;
	bh=qz0bCUPY1E2emqHcqnDcimZMYRNJk6/v1Gwhj2roPRw=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=t0tge21/B7lJj3VYzjynOXixEgCmcfUiOCrNNOOnrorDPhtfKgIZH1RDjofs04KtTYOIhJfDDa5jHmUQOIkOOkgVRGIxQPXc3Qr7LZXEM+L2BPLMSphO210fneGQenzGRI54Mo8iOp453PhOoHaZL9T0O8Db6F/YBbFIVRkuIbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mHZJKsPy; arc=none smtp.client-ip=139.178.84.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mHZJKsPy"
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1C0545C548E;
	Sun,  5 Jan 2025 14:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92C06C4CED0;
	Sun,  5 Jan 2025 14:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736089148;
	bh=qz0bCUPY1E2emqHcqnDcimZMYRNJk6/v1Gwhj2roPRw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mHZJKsPy/kdhdGdQL36xqucIQUPietLeFw1eUz2EAOWBAvkeWvzGnsXVxB0ExeV1Z
	 NVmJv30oV/KfBRCJX2ZO2u1Lvw4ImB8UDvQA6CxrVBspMV0IG5+cuTBMfMmG+kHFQh
	 4P7Atr1knSm8pGeC4aKHu0Dvr1IAlhiYApQ3vQJDkGfRgHvI8kvxS4x2UIUepMIlUp
	 Ac6wONmeY+iFIW82fJzX8xD54pGvJhD9zmaJ/bTvZZgaj5m6qA9LFfqfn8eEdgTKr8
	 lZDjsCRGsA5Bmrhhp12kdt4WXw7QbCKxy4JRrOcxOzI7xPGPqAnmD6X1qK8NB9jZuN
	 jnsiqa8K0xKqw==
Content-Type: multipart/mixed; boundary="------------J8o2NhNhDgcrNBs6gi0qLsrq"
Message-ID: <c0428d69-2f18-45d3-8024-a9fe4170b23e@kernel.org>
Date: Mon, 6 Jan 2025 00:59:04 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] m68k goes DT
To: Daniel Palmer <daniel@0x0f.com>, geert@linux-m68k.org,
 fthain@linux-m68k.org, linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org
References: <20250105071433.3943289-1-daniel@0x0f.com>
Content-Language: en-US
From: Greg Ungerer <gerg@kernel.org>
In-Reply-To: <20250105071433.3943289-1-daniel@0x0f.com>

This is a multi-part message in MIME format.
--------------J8o2NhNhDgcrNBs6gi0qLsrq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Daniel,

On 5/1/25 17:14, Daniel Palmer wrote:
> Short version:
> I want to start converting m68k (including nommu) to use DT for booting
> so I can add few cool boards I have (e.g. dual 040/060 VME board..).
> I need ideas, help etc. Maybe if someone converted an m68k machine they
> are using to DT alongside me this would have some hope of actually happening?

I have been thinking about this for a while for the ColdFire targets.
In a few cases the drivers its uses are already devicetree enabled,
since they are used on some of the NXP/Freescale ARM SoC devices.
So this is interesting work to me.


> All of my WIP in-progress very messy code etc is here:
> https://github.com/fifteenhex/m68kjunk
> 
> Longer version:
> 
> As of today I have:
> - Modern (2024.07) u-boot fork that works on 000/030/040 real hardware/QEMU
>    that supports booting a Linux ELF image. For nommu a FDT blob address
>    is passed via a regiser, for mmu the normal bootinfo is created and
>    the FDT is passed via a bootinfo tag. nommu never used bootinfo and doesn't
>    need to.
> 
> - A Linux branch for nommu that removes most of the current DragonBall
>    code, makes it into a devicetree based machine and adds a bunch of
>    drivers etc. This works in a fork of QEMU I have and on the real hardware.
>    The DragonBall even has a working 1bpp framebuffer. The nommu branch also
>    works on 010 and better.
> 
> - A Linux branch for mmu that uses the crappy patches in this series and some
>    other bits to start moving the MVME147 board over to using DT.
> 
> - A buildroot fork that can build a 000 nommu userland etc. A patch to add
>    support for building for 030 is already in buildroot, I plan to send one
>    for 060 later.
> 
> - A bunch of DragonBall machines, an MVME147 030 machine, an Eltec E27 dual
>    socket VME board with one 040 at the moment but I have 060s to go in it once
>    I work out the need jumper changes, some other 060 VME boards, Amigas...
> 
> What I'm thinking:
> 
> - We initially add passing of an FDT via bootinfo for mmu
> - Add support for a generic machine that can boot almost anything so I can
>    bring up my new (to Linux) machines.
> - I will migrate MVME147 to device tree.
> - Some like minded person migrates a machine they have to device tree. :)
> - Maybe embed a FDT for machines that'll never get a bootloader that
>    supports this and use the machine type to select the embedded FDT
>    and move all of that stuff over without needing to mess with bootloaders.

To that end that is what I have been playing with. Doing it in a similar
way to what MIPS does. Example patch attached of what I did for non-MMU
ColdFire. So no boot loader support required.

Regards
Greg



--------------J8o2NhNhDgcrNBs6gi0qLsrq
Content-Type: text/x-patch; charset=UTF-8; name="coldfire-dtb.patch"
Content-Disposition: attachment; filename="coldfire-dtb.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2FyY2gvbTY4ay9LY29uZmlnIGIvYXJjaC9tNjhrL0tjb25maWcKaW5k
ZXggN2M0ZjdiY2M4OWQ3Li5hNDk0OWI2OWUxZGMgMTAwNjQ0Ci0tLSBhL2FyY2gvbTY4ay9L
Y29uZmlnCisrKyBiL2FyY2gvbTY4ay9LY29uZmlnCkBAIC0zOSw2ICszOSw4IEBAIGNvbmZp
ZyBNNjhLCiAJc2VsZWN0IE9MRF9TSUdTVVNQRU5EMwogCXNlbGVjdCBVQUNDRVNTX01FTUNQ
WSBpZiAhTU1VCiAJc2VsZWN0IFpPTkVfRE1BCisJc2VsZWN0IE9GIGlmIENPTERGSVJFCisJ
c2VsZWN0IE9GX0VBUkxZX0ZMQVRUUkVFIGlmIENPTERGSVJFCiAKIGNvbmZpZyBDUFVfQklH
X0VORElBTgogCWRlZl9ib29sIHkKZGlmZiAtLWdpdCBhL2FyY2gvbTY4ay9LY29uZmlnLmRl
dmljZXMgYi9hcmNoL202OGsvS2NvbmZpZy5kZXZpY2VzCmluZGV4IGU2ZTNlZmFjMTg0MC4u
ZWEwYmNlNGRiNjM5IDEwMDY0NAotLS0gYS9hcmNoL202OGsvS2NvbmZpZy5kZXZpY2VzCisr
KyBiL2FyY2gvbTY4ay9LY29uZmlnLmRldmljZXMKQEAgLTE0NCwzICsxNDQsMTQgQEAgY29u
ZmlnIFNFUklBTF9DT05TT0xFCiBlbmRtZW51CiAKIGVuZGlmCisKK2NvbmZpZyBFTUJFRERF
RF9EVEIKKwlib29sICJFbWJlZGRlZCBkZXZpY2V0cmVlIEVMRiBzZWN0aW9uIgorCWhlbHAK
KwkgIElmIHRoZXJlIGlzIG5vIGNhcGFiaWxpdHkgZm9yIHRoZSBib290IGxvYWRlciB0byBz
cGVjaWZ5IGEKKwkgIGRldmljZXRyZWUgKERUQikgdGhlbiB0aGlzIG9wdGlvbiBhbGxvd3Mg
Zm9yIGl0IHRvIGJlIGVtYmVkZGVkCisJICB3aXRoaW4gdGhlIGxpbnV4IGJpbmFyeSBpdHNl
bGYuIFR5cGljYWxseSB5b3UgY2FuIGRvIHRoaXMgd2l0aAorCSAgc29tZXRoaW5nIGxpa2Ug
dGhpczoKKworCQlvYmpjb3B5IC0tdXBkYXRlLXNlY3Rpb24gLmVtYmVkZGVkX2R0Yj08Zmls
ZW5hbWU+LmR0YiB2bWxpbnV4CisKZGlmZiAtLWdpdCBhL2FyY2gvbTY4ay9jb2xkZmlyZS9o
ZWFkLlMgYi9hcmNoL202OGsvY29sZGZpcmUvaGVhZC5TCmluZGV4IGM2ZDdmZDI4YzYwMi4u
ODhmZDhiNWIzYmRhIDEwMDY0NAotLS0gYS9hcmNoL202OGsvY29sZGZpcmUvaGVhZC5TCisr
KyBiL2FyY2gvbTY4ay9jb2xkZmlyZS9oZWFkLlMKQEAgLTEzMyw2ICsxMzMsMTUgQEAgX2lu
aXRfc3A6CiAubG9uZwkwCiAjZW5kaWYKIAorI2lmZGVmIENPTkZJR19FTUJFRERFRF9EVEIK
Ky8qCisgKiBJZiBlbWJlZGRpbmcgYSBEVEIgaW4gdGhlIGtlcm5lbCBFTEYgYmluYXJ5IHRo
ZW4gY3JlYXRlIGEgcGxhY2UgaG9sZGVyCisgKiBmb3IgdGhhdCBzZWN0aW9uLiBJdCB3aWxs
IGJlIGluc2VydGVkIGFmdGVyIHRoZSBmaW5hbCBrZXJuZWwgYnVpbGQvbGluay4KKyAqLwor
LnNlY3Rpb24gIi5lbWJlZGRlZF9kdGIiLCJhdyIKKy5sb25nIDAKKyNlbmRpZgorCiAvKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKiovCiAKIF9fSEVBRApkaWZmIC0tZ2l0IGEvYXJjaC9tNjhr
L2tlcm5lbC9zZXR1cF9uby5jIGIvYXJjaC9tNjhrL2tlcm5lbC9zZXR1cF9uby5jCmluZGV4
IGM5MjZkYTlkNWVjMi4uZDFkNzljNDFjNmYwIDEwMDY0NAotLS0gYS9hcmNoL202OGsva2Vy
bmVsL3NldHVwX25vLmMKKysrIGIvYXJjaC9tNjhrL2tlcm5lbC9zZXR1cF9uby5jCkBAIC0z
Myw2ICszMyw4IEBACiAjaW5jbHVkZSA8bGludXgvaW5pdHJkLmg+CiAjaW5jbHVkZSA8bGlu
dXgvcm9vdF9kZXYuaD4KICNpbmNsdWRlIDxsaW51eC9ydGMuaD4KKyNpbmNsdWRlIDxsaW51
eC9vZi5oPgorI2luY2x1ZGUgPGxpbnV4L29mX2ZkdC5oPgogCiAjaW5jbHVkZSA8YXNtL3Nl
dHVwLmg+CiAjaW5jbHVkZSA8YXNtL2Jvb3RpbmZvLmg+CkBAIC03MCw2ICs3MiwzMSBAQCB2
b2lkICgqbWFjaF9oYWx0KSh2b2lkKTsKICNkZWZpbmUJQ1BVX05BTUUJIlVOS05PV04iCiAj
ZW5kaWYKIAorI2lmZGVmIENPTkZJR19FTUJFRERFRF9EVEIKK3N0YXRpYyB2b2lkIF9faW5p
dCBtNjhrX3NldHVwX2ZkdCh2b2lkKQoreworCWV4dGVybiB2b2lkICplbWJlZGRlZF9kdGI7
CisJcGh5c19hZGRyX3QgZmR0ID0gKHBoeXNfYWRkcl90KSAmZW1iZWRkZWRfZHRiOworCisJ
cHJfaW5mbygibTY4ayBnZW5lcmljIERUIG1hY2hpbmUgc3VwcG9ydCwgRkRUIGJsb2IgYXQg
MHglMDh4XG4iLCBmZHQpOworCWlmICghZWFybHlfaW5pdF9kdF92ZXJpZnkoX192YShmZHQp
LCBmZHQpKSB7CisJCXByX2VycigiRkRUIGJsb2IgaXMgYmFkPyFcbiIpOworCQlyZXR1cm47
CisJfQorCWVhcmx5X2luaXRfZHRfc2Nhbl9ub2RlcygpOworfQorCitzdGF0aWMgdm9pZCBf
X2luaXQgbTY4a19kdGJfbW9kZWwodm9pZCkKK3sKKwljb25zdCBjaGFyICptb2RlbDsKKwlt
b2RlbCA9IG9mX2ZsYXRfZHRfZ2V0X21hY2hpbmVfbmFtZSgpOworCWlmIChtb2RlbCkKKwkJ
cHJfaW5mbygiRFRCIHJlcG9ydHMgbW9kZWwgPSAlc1xuIiwgbW9kZWwpOworCWVsc2UKKwkJ
cHJfd2FybigiRFRCIGhhcyBubyBtb2RlbCB0eXBlP1xuIik7Cit9CisjZW5kaWYgLyogQ09O
RklHX0VNQkVEREVEX0RUQiAqLworCiAvKgogICogRGlmZmVyZW50IGNvcmVzIGhhdmUgZGlm
ZmVyZW50IGluc3RydWN0aW9uIGV4ZWN1dGlvbiB0aW1pbmdzLgogICogVGhlIG9sZC90cmFk
aXRpb25hbCA2ODAwMCBjb3JlcyBhcmUgYmFzaWNhbGx5IGFsbCB0aGUgc2FtZSwgYXQgMTYu
CkBAIC0xNjYsNiArMTkzLDExIEBAIHZvaWQgX19pbml0IHNldHVwX2FyY2goY2hhciAqKmNt
ZGxpbmVfcCkKIAkgKiBHZXQga21hbGxvYyBpbnRvIGdlYXIuCiAJICovCiAJcGFnaW5nX2lu
aXQoKTsKKworI2lmZGVmIENPTkZJR19FTUJFRERFRF9EVEIKKwltNjhrX3NldHVwX2ZkdCgp
OworCW02OGtfZHRiX21vZGVsKCk7CisjZW5kaWYKIH0KIAogLyoKZGlmZiAtLWdpdCBhL2Fy
Y2gvbTY4ay9rZXJuZWwvdm1saW51eC1ub21tdS5sZHMgYi9hcmNoL202OGsva2VybmVsL3Zt
bGludXgtbm9tbXUubGRzCmluZGV4IDI2MjRmYzE4YzEzMS4uMWJlM2JmZTMxYmE0IDEwMDY0
NAotLS0gYS9hcmNoL202OGsva2VybmVsL3ZtbGludXgtbm9tbXUubGRzCisrKyBiL2FyY2gv
bTY4ay9rZXJuZWwvdm1saW51eC1ub21tdS5sZHMKQEAgLTcwLDYgKzcwLDE1IEBAIFNFQ1RJ
T05TIHsKIAlJTklUX1RFWFRfU0VDVElPTihQQUdFX1NJWkUpCiAJSU5JVF9EQVRBX1NFQ1RJ
T04oMTYpCiAJUEVSQ1BVX1NFQ1RJT04oMTYpCisKKyNpZmRlZiBDT05GSUdfRU1CRURERURf
RFRCCisJU1RSVUNUX0FMSUdOKCk7CisJLmVtYmVkZGVkX2R0YiA6IHsKKwkJZW1iZWRkZWRf
ZHRiID0gLjsKKwkJKiguZW1iZWRkZWRfZHRiKQorCQlLRUVQKCooLmVtYmVkZGVkX2R0Yikp
CisJfQorI2VuZGlmCiAJLm02OGtfZml4dXAgOiB7CiAJCV9fc3RhcnRfZml4dXAgPSAuOwog
CQkqKC5tNjhrX2ZpeHVwKQo=

--------------J8o2NhNhDgcrNBs6gi0qLsrq--
