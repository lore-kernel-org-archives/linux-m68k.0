Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE16E17BD9
	for <linux-m68k@vger.kernel.org>; Tue, 20 May 2025 22:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747779219; cv=none; b=ZonTS+KgH8ITOxUjSLWrE58dUxQgEF7JxShbQySH5/8h36qgaqrHqBg62KSa2Z8Oi075wdXLA7DxaI/O+rpGt0lWbU0mA7uHN0A62h8evSA4l2DdtQWIpjIUgv62U7LOCxabfpaLEQlXj39vhGzstKwU7ADASQCpj2HwRry0o6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747779219; c=relaxed/simple;
	bh=25nMf4+pKMupyxwBfqq8vmkmKdG2W7YV/LcjPzsh6p8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a8p/yPOhV8A02PaXg/SnixJ7S0QuaOdI/ywjdh5uV1fqcEgzGFTM+BYMMTzcq21vVQGfUATLNi7MvroZolqQyVd+0DpUjJNuKvRWqKHkmSVbvDxl7C4B3yJX0VKziGcBqeAGWmUdLwY7YbTsIkO6yaoA95HBtq8tSWKrKqXsFdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=hhW3ShHQ; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="hhW3ShHQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Dq0HhiOUly8pe5c/ejgOto60RCYFASztklBZ4A8Na0Q=; t=1747779216; x=1748384016; 
	b=hhW3ShHQFlT76534lJRC/94hjdrvQzuuXnsh0NhQPEdkVdp4Ye8SkyPSou8UIqHtSQ0vMVKuPDC
	sBr6C4aXZgMJJVbk8Ny7LEcWG+ZbJYrUCfmPAYFkDgfzZDvt22zs8fYwUyzO3f5BMpkmN43sg3Qqd
	2jX05vnk4O1UvgfGfahE1kjTcTCbMQZQb4zlO7TcX+wkLySHVRgIlXRRZB+yJF6vtCHeIA3vNMM6g
	1Rr+g0XUJ8JbhJR0g1JvzbF8JCwseJhv25Cv2o0HKd938XhFW+EXa6imApNT9GvskjCdaqnXPzJ3P
	pQ7BvP0Fhp1JCLfJXFpVB2itZ6YM5wzSqMVA==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uHVDH-000000012lO-43ry; Wed, 21 May 2025 00:13:31 +0200
Received: from p5b13afe4.dip0.t-ipconnect.de ([91.19.175.228] helo=suse-laptop.fritz.box)
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uHVDH-00000001sZT-36kt; Wed, 21 May 2025 00:13:31 +0200
Message-ID: <e16df549745be6c1f3d815a60172d8ee8305ed95.camel@physik.fu-berlin.de>
Subject: Re: Tuple and changes for m68k with -malign-int
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@linux-m68k.org>, Florian Weimer <fweimer@redhat.com>,
  James Le Cuirot <chewi@aura-online.co.uk>, debian-68k
 <debian-68k@lists.debian.org>, linux-m68k	 <linux-m68k@vger.kernel.org>,
 Libc-help <libc-help@sourceware.org>
Date: Wed, 21 May 2025 00:13:31 +0200
In-Reply-To: <CAMuHMdWVjDGYW2SerNV5ov6jX1pPNw_j1=qpawBCJph18_SE2w@mail.gmail.com>
References: 
	<e9035006d50933fb02727fa373629cc821784f6c.camel@aura-online.co.uk>
	 <08ce465732a0eb0dce550978c98ef822abba5f96.camel@physik.fu-berlin.de>
	 <8734d1kofn.fsf@oldenburg.str.redhat.com>
	 <f1f9bcd9fe3823935e747748f09bcf88cfc4d947.camel@physik.fu-berlin.de>
	 <3388daa5-8129-e78d-d4bc-d7696cd3a30f@linux-m68k.org>
	 <1ceb208498c53cf8db2acf746a4649f1eaea1457.camel@physik.fu-berlin.de>
	 <CAMuHMdWMJKbd-Nfe6yWc_XE56KFmffnJ3T9AhNgUZ4=m9UGSeA@mail.gmail.com>
	 <224e0eddab2deb8579e023e5bfc739e7151115d4.camel@physik.fu-berlin.de>
	 <CAMuHMdWVjDGYW2SerNV5ov6jX1pPNw_j1=qpawBCJph18_SE2w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi Geert,

On Tue, 2025-05-20 at 11:58 +0200, Geert Uytterhoeven wrote:
> > interested in new, "fancy" packages, just don't upgrade or install Debi=
an
> > Etch or similar. Changing the default alignment does not affect existin=
g
> > software.
>=20
> What about existing software that is aware the minimum alignment is
> 2-bytes on m68k?

I just remembered that I actually asked the NetBSD people about that and th=
ey
said that they didn't run into any problems. In fact, here is a directory w=
ith
more than 5500 packages built for NetBSD/m68k with 4 bytes alignment:

https://cdn.netbsd.org/pub/pkgsrc/packages/NetBSD/m68k/10.0_2024Q3/All/

So, I think we're safe in this regard. There are certainly going to be a fe=
w cases
where packages may need to be patched. But I would assume these to be rathe=
r rare.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
