Received: from sonic311-25.consmr.mail.ne1.yahoo.com (sonic311-25.consmr.mail.ne1.yahoo.com [66.163.188.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1136135962
	for <linux-m68k@vger.kernel.org>; Wed, 11 Jun 2025 04:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.188.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749614703; cv=none; b=Sm9UgSEqf+zOkMdSSHouQIxud50hNezLH4w2MSooaDmv7k4oXeR9ydU0d/g6KFMBfwGLN438S866+niYOdu4TTiGKiZDQGfbsaNVQuiL0uSVq9TTytqZxXD4q242S2sAnm1/bIOuM4Qo6zWZUZoLbSoXSHJC8alu/IqSXFfsZys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749614703; c=relaxed/simple;
	bh=vc3uRWtJnTtpBPnsIEtLXkyW7PobIrxUMZU0N6BBNIo=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=GrRMzjfmCZWG98zn1WXRs5HlC/f4ae/PnosTDjAPwic2eeE+0FUa8v4bOZIfehh5fWtoCqzdfPmarAJ54inuFOQ657DfkBdrVc8mdnZEHTwwvfGrBbUR6dIJQvUO71JJoLes4lfG55wrPUpxJflGTxzBsQaPeobkwvGOOticPCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=dKWpTxhe; arc=none smtp.client-ip=66.163.188.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="dKWpTxhe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1749614701; bh=MmybNCxwVLzPbVj8I9QXNNbyyLgzR0VDZelvGptBCjg=; h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject:Reply-To; b=dKWpTxheim4YPHIyvY4oeEnRZK6g9zSJYFpKp1JuvlANxiIQQGfArjrLNsrwfqrcYZYx2R4D3TdGPeutyNpkpHUtVBi3ev/W+/O2cyyLmowPcbbjBIilAtGXTUvCUEfTlZ+JLjTUoXBwx4OQ4mg7Xl75SKjQp4SvjK0ilDQMRNTh3k9rQEIabyic81pyru7cl/OhUvLl1euVC+pEFj+S1MNP9TIW1Hzzg2zvQon+Dkz7Ku8Oiylixu0vwPx+b389fBfYN59YKzgqEZSZZQck2hvvreIdPhJFjH0mbcva3tjk3zMD7WdxJwv0WqgCZ95E/1bh6fp9cRz3IBKYMrBXxg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1749614701; bh=FhaeCSs0rY9CN6eoQku8sDGRBxMcaycp2jkapE8kg96=; h=X-Sonic-MF:Subject:To:From:Date:From:Subject; b=R2q8kr/06CvZ/E3CqMsDmGLr2JUQgIuxPAgpyavMSGO0azK34Erp6mrv5OBegIZpCeDQB7PVCvTmlSWOpBcI6IVHozu5wW0NOivmAzfGksn4M4lNri2b5USQfh+DxoTn5A5uJ2mbBdFICYYDFQbfb7gtixY52IXzObjSBaGFtSmpe+uYfHsTAA+mPYgJrbo8eIsyMrQuTJnYfG7gFeykDGOHNhjSrJjX/TLEKW7Ux9rxTR/aPySc5cOqLZp2JjdzwJm1wT55jsPLHkDC+LZ8KVpWhLFRd9Zc+agYJGSwcR/LmMwvLZGR8xKiVHD3fGX6JXse6Xl9plyXTruE2/nUmQ==
X-YMail-OSG: eFX0aZIVM1lNlpemEbxDQVXWym6syf.y8snxckc3h22xkgjQknrzc0vbT8v324w
 NO0Xj75RJPoEywh1_nQv2Lt75Z_UZgRMgUFueN0Mwg4V7P78..GEFbBZi75AcL_nRWUax9lJZmuR
 gSWTGVZjpJsoxbB_n853w0IZH7QGV7yXprnvkSMeMfyn5Hp.Y2kO7ZL.yE1NQZz8hWhxPSBhYibz
 tcKenKU9lnNusXTELKmeUx4h_Wb4aaI7K83UTU_oa2fQBPunRQ0nYUphiDIQfPL1b9Z6pmMj.3N7
 UixoGp8gRU_lpAINHjn5xO_AvQZxbyldc7OMCuz4joVOJ9Yzn4HeLOrsUgRdqnUvGUjVSLZiUIRQ
 DK.Y21NEClz7vMPTyZW5NcO9AeLQHJRG.hnfcN36tHsZGTE.yaeF28n4XWwmBNEG9SSLXREkUFd9
 sFC7aQkfdZQNOLR5Uh0KcGky0hytqRPXWIb_rQWoxzYGv0sdgnP3Jxd.BjpdHcZ2f8Z3JA_rRhFC
 84qZJ3o7hLRa6HLx6H3YMwGJ7MIcYKWGKrzCUJRvD6NOp_UON72pQ8WoyHN8a.FCgb5nFYxsHMDi
 hQrM09N99EE..Z5CLnR2n6Q38No2eP77K04Ub2yzzifctoF4PYkl7mOEYhKvB_u_ZmUZI_3fpqei
 ewN3KCfAyoySLgh4js6rN78olLkl_eYw5A50OVaJopmUqDoNwSbDkzD5gmCCp5jtl..IUkzzXqF2
 SuGYtVYDk4DmGaQ5B0kRMk6AhfKWC1yCS2LncEBkpblewTtpetq9pP9s0MAtsWm5EmuXXIm3dPQl
 NbaKzoe_fNbdlMcJAV6PHzwe.b4aSNpFQ_UQvGxbSRf8g8Gxpc4iguA4uquwa9TOFPU4SmnuvGte
 SUQtw9Vd0xGtN_NTghr4uup4B3UAyB.zwPa2ayxHcoyLEFDDkLwbLxdsIUSHmtt0CDz2wDpGkj93
 DZ7RL4vP8AN_zt.AIaIie0J1YhWAhjKFpUcJVQjnvT4T3.7LjXKUWxR6iUiOtuCa0uegznxXB1q3
 evG9hTPM6dau4As6tr423FN6PJ0gQ2sfv9gzaVySxobW4eR638eW0NYHVhBPXM1cykyoNOUdWzrZ
 V9g3jIEbj46IhY3MjX1h7EsV8TH6SkkkY7ccbKJqRHeS4teVld__47d0ROWcAD99TvsZHcjQXFu0
 yemyqgbhOvBOzsUPICVrMJL1TrOcRgpgFFcaghra.RaPaHsldyHTbzr7MUyvFYeJiuT4mCK9J5iU
 Zb0W6JnVumLyfcIfm6nnLZXxg4JucrHcJDfM.WEsD0Ky78GS8QPUN6akhqP8G64B1CGVXMjzK8.C
 QrnFEOgmd88OHGVqFxxbcyAs4nOhZp_pJu.05_kUzraOhYRXcVqgdlMbQ1_g7RlAZAhvHA8fk.Lf
 rgfioSj6nuCoH4Y9xLpVHaQ5aeCDQlcxO2RIylCHpdY7pBkqhVLJdas31TPEnw0EYrASKKu36_vh
 m7L1KiM.LToDkrPaAw3ByPPwmDFqbSwp6pkc9yIShLB.S_gF9O3_6a5bvKRnlIHzDK9MEBp1kOoL
 aZ_iZ561tJYhlFgp7WiBdCm5ntmTs8tKR7f08drRMJDw4.IgWvqg6l3gJdb2Y94IxDuGdQyu6LdM
 sp_ylHIu6FFIrDHX2LPrMFdRtwahGK.fdsVrWspvAh90A2LSs547dP16o6Eli2yp.RwNa.DOFBa_
 Ve5ewNihnjOcncwnaF_H_9YrpChhh665RMB.gkoT879syR16aimWp.fvG57YnZwBbV7O4SHXG7ij
 MulLXznDgP5Jna.m9hZbTT5EKReEwfqJGVzgO0X3dEQ_OdlIjLxxJHvm.4.GIc.xUxes3z9_aVTq
 CmzLv03NfwnI0CQAPeH8bmBLB9Ga_vDRl..3ERTOxGA_vOnlnkbF4RkhVMGcApmbUsKrCBIzyuNe
 9MVwj6uzHv4t7y6CnBHziOyowPU.rlwywHnxeXPYyAIbiIT1QZDyFAMB0d34bdwWYNT4Pp5rVMsV
 _kUevyhs1Vtl2UNaQv2Wx0fQP2uacqE0I5y986_R1nesUHfOk2aESa1dwuOKWluNZiFJzvvCh.Kq
 oZyBBuoxKrqfc7gRcDdIOp0SiYrZetA.xrVyabgYWLodnpn3zHor_lLzNlEp_Uotds_fPtd2eZko
 6LCM6G902c083NG01seOyLm4_9fxoknmQ5ntta1.EkNPQH3X0ADIY7Usk8Bfc2v5tJSpZ312lIa9
 GoQJELABw7omYecFEcgEPF32PJDpngDcMjGto6kPjhu_RQD9fTS8KfP7W_njfEB2H
X-Sonic-MF: <userm57@yahoo.com>
X-Sonic-ID: c1d7748c-f758-4c99-aba7-17fb09d0dd00
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.ne1.yahoo.com with HTTP; Wed, 11 Jun 2025 04:05:01 +0000
Received: by hermes--production-ne1-9495dc4d7-lc7tc (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID d85ecfb6a0cb2bcf6c2c6b5f3bf1a9c4;
          Wed, 11 Jun 2025 03:04:16 +0000 (UTC)
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Finn Thain <fthain@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 port-m68k <port-m68k@netbsd.org>, debian-68k <debian-68k@lists.debian.org>,
 linux-m68k <linux-m68k@vger.kernel.org>
References: <ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
 <442267d5-241e-44a5-9b54-fee06bc5c03b@yoseli.org>
 <9013836044f8bfb7f0cd62ba536f6a1c75034465.camel@physik.fu-berlin.de>
 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org>
 <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
 <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>
 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
 <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org>
 <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de>
From: Stan Johnson <userm57@yahoo.com>
Message-ID: <0d7b5c87-f0f7-70a4-cf75-5147e67904da@yahoo.com>
Date: Tue, 10 Jun 2025 21:04:15 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.1
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.23956 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On 6/10/25 5:26 AM, John Paul Adrian Glaubitz wrote:
> ...
> On m68k, on the other hand, the user base is so small and insignificant 
> that the costs for introducing the change are negligible and the profits 
> for making the change strongly outweigh the disadvantages.
> ...
As part of that "small and insignificant" user community, I can say that
making things too complicated or difficult will be detrimental,
especially affecting new users.

Look at it from the perspective of a new user today on m68k systems. I
still remember the joy of being able to get a Linux 2.x kernel working
in Debian 3 on an ancient Mac IIci or SE/30. Now as the complexity
grows, I can't do much of anything useful with an old m68k Mac other
than log in (text only), edit a few files and download a few things from
the public Internet. Almost everything related to an end-user's updates
of a Debian or Gentoo distribution has to be done in QEMU or
cross-compiled. Users don't want to be berated or invited to feel bad or
lazy for wanting old things (e.g. mac-fdisk or dump/restore) to continue
working on old systems, or for wanting old programs to continue to work.
Treating users well, even if they aren't as good at programming as you
are, will make them want to be part of your team, not just part of an
insignificant user base of a product that you provide.
