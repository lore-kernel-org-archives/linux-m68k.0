Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B803126DF
	for <linux-m68k@vger.kernel.org>; Mon, 18 May 2026 13:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779109409; cv=none; b=jG3D2kbumys+PXZg/bxj2hjr7jAcd4kPBXBsG/1VvVLN56uCezXORrOKUk3D4EmVOi7gwk1Z8iaU5uWQPnIp7upffBIQ7sa/PL6Uo07evUDHt4cPN94lO49iCWNfCo7+kL8MUiEhFPQ7ryC/r/GtSrIgqTTPRfc7+SnSshnT1bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779109409; c=relaxed/simple;
	bh=yQK2tuEC7Lq6jwB22azXJQuOAGqsuv/WML2Kw6s4yto=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YseXCeSu79GjRtzXQs20mKwyTM64ZZEhDZFWG2xveUIT+klTFFOaEwXvQT6+rtN0heVDFMSMZ7BaSPxTs2cFacHM5wsqG50G2/DOolyboSFJREppYWPjTE7YNBCJ9n0WnUyb0gX3aalj6Vegb5qgJC8120Ghv5h11xmzqr6f/qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=fcKF+RGy; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="fcKF+RGy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID:From:
	Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=JbL8tpEWKS8eF3BCKcaQSMKar1yKaIiFoadVqTKK0zQ=; t=1779109407;
	x=1779714207; b=fcKF+RGyQfzo+ulXJlGy3DokQRMDg+g/PnQqwHz4sqxRvUzuYwzCbFIMxFTwq
	cQo/ok8/uPvfgK+f+OW79Sb6YaJT+iDRB9MWjvh2AsEK9UOIPdWqjHA7J8ja8D6FPHTvisZ9325Wt
	Gric6nse99GKGdJYTTaPfwwYMyDAUEBn2+LqgF/dCpPJ/Zf4KrTCSOg/JnZK+9P92ySum4dpBuIdd
	m/6UZ8clr/lWsd6w/WAlczXH19+7v9f6lkB+QutwzbxjcgXW5GamehzvypOyN1Px0dAZpzxAaRQfV
	L7pmvX4GjQn/sAh9tKE7hPFnvXpZnCZle+MBMMf2hT7+9r833g==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.99)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1wOxcz-00000002z5r-2RTs; Mon, 18 May 2026 15:03:25 +0200
Received: from p5b13a134.dip0.t-ipconnect.de ([91.19.161.52] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.99)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1wOxcz-00000003O9U-16DD; Mon, 18 May 2026 15:03:25 +0200
Message-ID: <6efb67b12fd971c6d38a692d7b391ce4a75b0f4a.camel@physik.fu-berlin.de>
Subject: Re: Summary on what's blocking full Rust support on m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: debian-68k <debian-68k@lists.debian.org>, linux-m68k
	 <linux-m68k@vger.kernel.org>, port-m68k <port-m68k@netbsd.org>
Date: Mon, 18 May 2026 15:03:24 +0200
In-Reply-To: <29d725b5647c176b8cef0d3442d1b3440e6a1a9a.camel@physik.fu-berlin.de>
References: 
	<29d725b5647c176b8cef0d3442d1b3440e6a1a9a.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-ZEDAT-Hint: PO

Hi,

On Thu, 2026-04-23 at 09:39 +0200, John Paul Adrian Glaubitz wrote:
> Once the alignment issue has been sorted out, the next issue to address i=
s the lack of the
> M68k backend in LLVM to handle 32-bit offsets for variables and jumps [4]=
. Currently, the
> backend will always generate 16-bit offsets which is not enough to compil=
e all Rust code,
> although some Rust code compiles also with 16-bit offsets.
>=20
> I have created a rough patch to add support for 32-bit offsets with the h=
elp of Gemini but
> the patch has multiple problems as outlined in the GitHub issue in [4]. O=
ne of the problems
> is that it creates the 32-bit offsets in an inefficient way as if the tar=
get was a ColdFire
> CPU. However, the original 680x0 CPUs can actually use more efficient cod=
e to address 32-bit
> variables and jumps. The inefficient way would still be used when ColdFir=
e support gets added
> to LLVM though [5].

I have used Google Gemini Code Assist now [1] in order to create a patch to=
 add support for 32-bit
relocations to the LLVM M68k backend. This time, the code makes use of the =
full capabilities of
68020+ CPUs and does not the inefficient four-instruction method to impleme=
nt 32-bit accesses.

I'm hesitant to send this in for review as this was basically written by Ge=
mini under my supervision
with a lot of testing of build tests.

Adrian

> [1] https://github.com/llvm/llvm-project/issues/181481#issuecomment-44769=
33700

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
