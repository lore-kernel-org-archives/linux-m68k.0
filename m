Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6862857C9
	for <linux-m68k@vger.kernel.org>; Wed, 18 Jun 2025 10:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750241047; cv=none; b=ZWA+jkgJKjjgmGSfqltVOXspa0WdGH7pH0gHWdfwm3IOGgI8UmeySlvZmJfRtu//k3hOXkVmY/BDfmPvOh0+mjGDxFpdI+eL4Qqti0RPGHJTauWPlvjWB4QvAYhudQa2qefp9qCQuNfpzirnBCrNQLO+DFjBF0DlA4yIIbNbn1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750241047; c=relaxed/simple;
	bh=VMYXuT/7K/aK+unyZhPOqxAlDuSvocmWHolKmS/DQ9Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TabinIaI312mj1rP8eOIjPG1SeHFJEnU5QsqMMpzcbDpMYZ7cT/rbOMKctIPPSq7AU6KVZlb5Fo7hFE91L/oYWEoAND7ckYgBCSDCF1P+X2Amr60wYqYbbKWPVE4A52wiNC5Hb2zLZe2eMzMjrS0UziKByxY/4xRbnpOvtBxB3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=mT0smB9g; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="mT0smB9g"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=7CKcyj77UaxQ5xqrfJLAqc+JR8czuBi5SLxUHPiqpac=; t=1750241044; x=1750845844; 
	b=mT0smB9gfGrCSWH1gvGR7V3hlqtTOjgMYguJ4O536AYFj7dGVIKzFosbQM/kRCbC0x7dZEYVGiQ
	udA4eJHoQ/Q3QdSl6pOjnk4PNrvKWtyPXN5kBYJQoQVwHj+q/Vtg/pbVsp+jh9qpoUT26EG94aqWw
	eTvn8AFpF966OQt+UqXyyEOIex5Gb6scLrXZr2WXW9pkfbCN5TM0blxxivCzvVEguk7JK2HwIoyf0
	Rw64Z098IrkkpH5GjBKGuQ+K4oc1VHs4ULHClJ+0DH9U/jL/q/OBuvCwkoxYaO2hTmzOYW4NVkbCT
	aoVogK1Mms9dbNP9vjWg1LzYRq5NlZT7p37g==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uRpeE-000000049XR-3B3v; Wed, 18 Jun 2025 12:04:02 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uRpeE-00000003Sli-2DMV; Wed, 18 Jun 2025 12:04:02 +0200
Message-ID: <29677f1e81b42c87926875109907485e41587883.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: port-m68k <port-m68k@netbsd.org>, debian-68k
 <debian-68k@lists.debian.org>,  linux-m68k <linux-m68k@vger.kernel.org>
Date: Wed, 18 Jun 2025 12:04:01 +0200
In-Reply-To: <CAMuHMdVuU1bsoUwXNkuUvxjb-F-YS325dEX+KPtY4FJPbtMUXw@mail.gmail.com>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
	 <80f5c684-638b-4486-9026-1f8689a7f147@yoseli.org>
	 <95e56d983ace4976143c7e1180ffe5606c0ee3fe.camel@physik.fu-berlin.de>
	 <CAMuHMdXNF5OCjdK7+AHWTCqSEDa-n-dYdESVVSP5Jn9UqA6feA@mail.gmail.com>
	 <d1d407e4df2b3558efd5769de746645823e73513.camel@physik.fu-berlin.de>
	 <758f14d8-6d03-2aab-468b-170b0bbb7d2a@linux-m68k.org>
	 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
	 <CAMuHMdUACa7Z-BV077H+G0Hd=mTBqLw7VdshbYCixeVtsuHYeg@mail.gmail.com>
	 <6e6f8e27ff90ce3f8535fc4f5c57049c59a9b227.camel@physik.fu-berlin.de>
	 <CAMuHMdWFb2kBpEBV3PQuwyCoCDBsANZobTSccrEog7j_dcBF2Q@mail.gmail.com>
	 <49a62eda6aea856df248aa223365b5230020d829.camel@physik.fu-berlin.de>
	 <CAMuHMdVFrrtMkn1LSV0t0Yxed1uiyjmovu=P9jfz8jWJViNNHQ@mail.gmail.com>
	 <ddef536e0645c9d7cebfd829837af653da50afaa.camel@physik.fu-berlin.de>
	 <569d73fb-8ad5-46f0-bf4c-568919f319e7@helsinkinet.fi>
	 <b2f74ffcd4c4a8aef248c21cd6deafcb92d86d37.camel@physik.fu-berlin.de>
	 <022ab204-7be9-4f6a-a92f-2601fae1f146@vivier.eu>
	 <5d8619dfe4134319b558684209f2b89c5c1447cf.camel@physik.fu-berlin.de>
	 <889f54af-2317-ee51-cea5-47d813683944@linux-m68k.org>
	 <5de0835e46f8c2479668fe5fe98f8e0d230cbfce.camel@physik.fu-berlin.de>
	 <d3c2060c-f2ea-f80d-2462-d3dba29950c2@linux-m68k.org>
	 <0b09dcea10c9bab4a50b2599ef8ac59b89f09b3e.camel@physik.fu-berlin.de>
	 <8eb87c55-95c2-0c73-4941-6e8732266220@linux-m68k.org>
	 <4c0581c5baccf73e96e53d755e70b57b23ba1da4.camel@physik.fu-berlin.de>
	 <CAMuHMdWdDdoO9w9PvULL6+vVZs1Fn1boobgV9fO9OqpyhOsznQ@mail.gmail.com>
	 <cebbe80cb85e004176ae2b566132d6d8e92e73db.camel@physik.fu-berlin.de>
	 <CAMuHMdVuU1bsoUwXNkuUvxjb-F-YS325dEX+KPtY4FJPbtMUXw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hello Geert,

On Wed, 2025-06-18 at 11:56 +0200, Geert Uytterhoeven wrote:
> > Coldfire already uses a different alignment (for the stack):
> >=20
> > /* ColdFire and fido strongly prefer a 32-bit aligned stack.  */
> > #define PREFERRED_STACK_BOUNDARY \
> >   ((TARGET_COLDFIRE || TARGET_FIDOA) ? 32 : 16)
> >=20
> > It's instruction set is also not fully compatible AFAIK.
>=20
> Sure, but you will impact it regardless.

Could you please elaborate this a bit more, please?

Coldfire is handled as a separate target via TARGET_COLDFIRE in GCC, so we
would certainly be able to toggle the alignment settings independent of
what's done on classic m68k. In the Linux kernel, Coldfire is also a separa=
te
arch, so the alignment settings can also be handled there separately if nec=
essary.

It's not really necessary to enforce this on Coldfire. However, since build=
root
builds completely from source, it wouldn't even be a problem to change the =
alignment
there as well.

PS: I would like to lead a discussion on how to implement this properly and
not continue to have one why this shouldn't be done as the latter is contin=
uing
to take a lot of energy.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
