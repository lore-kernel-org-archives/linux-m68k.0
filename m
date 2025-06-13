Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de [130.133.4.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850F224C08D
	for <linux-m68k@vger.kernel.org>; Fri, 13 Jun 2025 11:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=130.133.4.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749813412; cv=none; b=rYXLaopcKtwkv5CJaM+Bl8nKd1EnmvGaxOOMKdeeRuU+YLDdqR4/avD86A4v+cn5Sjk7anh7QpHQ//13D99ng2f5TuDiW/zK45TL0VJ/meWFOHfPXEyaqXJ6CoKZwc6MSxdsWzxsqKWKc10ZYN/o1sCNha3Qpf2QPpsCMB6uzqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749813412; c=relaxed/simple;
	bh=me5mMw0+WEWhwCa9j2tebqWxpjho2lBXxL2qWquNpPc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bjeZkr9BoTkcfR65ZoHNlyOmlf2Q0YcMNoWZI9KL0UqzH69yPYvxIXUNNt59tekS2AQsF2z8UDCUt8g6Zr1qlBA6qJSPJRpaBvlmRsVIhPS4dBUTCYMH3jCjmn6nl0qSM44IyiI4MyhWg9PF6uBeNGHGb4axtlbeoXd/qkPK4Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de; spf=pass smtp.mailfrom=zedat.fu-berlin.de; dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b=hfrVptSf; arc=none smtp.client-ip=130.133.4.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zedat.fu-berlin.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fu-berlin.de header.i=@fu-berlin.de header.b="hfrVptSf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=fu-berlin.de; s=fub01; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nWghLvz8LcHiApNtdY2/crkR0BdVNcuATpdTFcxu6l4=; t=1749813410; x=1750418210; 
	b=hfrVptSfqUS457TCOuo5Wxu7u2m/0pAiZrJ2JFwc8ULRBUF02S55HRmf3Gz6LfTJ7H44Z5Caurz
	hUJf5Oef8Ra+eyJDRWv8xpp2XAi1IK4T0gkoQYmUwJJiwKje9WVqIDoTK65qMKaaMVsobPCoPCe/B
	yjxveUc/WuysmZZvCh7jysuMO2McGIYOFaT9kPlFBEowivOO7ShcrfqRZruTBoLhJgFSvg97IJmmL
	/LdGajqGyebkzlJWo8T6qfiU77DyI7mM/rVLHqvzpcjcIH21GCW8Sxj2m2FD6j3ZO+VcmHNo7kmMo
	A2dVIxz+1LAR2zGtsSvadMQs51b7USqnmzqQ==;
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
          by outpost.zedat.fu-berlin.de (Exim 4.98)
          with esmtps (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@zedat.fu-berlin.de>)
          id 1uQ2Ot-00000000Z7h-0EfK; Fri, 13 Jun 2025 13:16:47 +0200
Received: from p57bd96d0.dip0.t-ipconnect.de ([87.189.150.208] helo=[192.168.178.61])
          by inpost2.zedat.fu-berlin.de (Exim 4.98)
          with esmtpsa (TLS1.3)
          tls TLS_AES_256_GCM_SHA384
          (envelope-from <glaubitz@physik.fu-berlin.de>)
          id 1uQ2Os-00000001N4f-3TvC; Fri, 13 Jun 2025 13:16:46 +0200
Message-ID: <c4f086207e68843ea154b5d41950957fa11c6837.camel@physik.fu-berlin.de>
Subject: Re: Question on BIGGEST_ALIGNMENT in GCC on NetBSD/m68k
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
To: "Administrator @" =?ISO-8859-1?Q?R=B7V=B7E?= <admin@r-v-e.co>
Cc: "stefan.k.reinauer@gmail.com" <stefan.k.reinauer@gmail.com>, 
 "fthain@linux-m68k.org"	 <fthain@linux-m68k.org>, "userm57@yahoo.com"
 <userm57@yahoo.com>,  "geert@linux-m68k.org"	 <geert@linux-m68k.org>,
 "jeanmichel.hautbois@yoseli.org"	 <jeanmichel.hautbois@yoseli.org>,
 "port-m68k@netbsd.org" <port-m68k@netbsd.org>, 
 "debian-68k@lists.debian.org"	 <debian-68k@lists.debian.org>,
 "linux-m68k@vger.kernel.org"	 <linux-m68k@vger.kernel.org>
Date: Fri, 13 Jun 2025 13:16:46 +0200
In-Reply-To: <WtNQmVJr3uIeOkUfpStavGscYvoTLpprxvowAOsqJKw8V7XCOZqKDi3Qw7Z1m8JVMsv71f0VZCVqZ3MiKnjLYp-VwSvtvTLkoVtJpAkA0gA=@r-v-e.co>
References: 
	<ae61eb01a3d323b61ee340919971725bed59ddef.camel@physik.fu-berlin.de>
	 <8e0186f61cc9bbed2373ae215e80ab7e70042793.camel@physik.fu-berlin.de>
	 <48ebcafa-467d-05a4-17f6-7cc078596d88@linux-m68k.org>
	 <48af5d8ed5b1546cb3db3b2c2314b1e41de38aad.camel@physik.fu-berlin.de>
	 <0d7b5c87-f0f7-70a4-cf75-5147e67904da@yahoo.com>
	 <131b33a26efd2b0e21dfee784821dcaf3aeddad4.camel@physik.fu-berlin.de>
	 <7d9d8c95-1b06-c6c5-0932-7ba3af55829a@linux-m68k.org>
	 <CABq5eXH8S9MVoRi5znU+u7EJPmaRA+8yOyd-QKBJMQa10UoAmw@mail.gmail.com>
	 <6c1d08bf4cd4d7c92338357bd61dca8a23559ad0.camel@physik.fu-berlin.de>
	 <WtNQmVJr3uIeOkUfpStavGscYvoTLpprxvowAOsqJKw8V7XCOZqKDi3Qw7Z1m8JVMsv71f0VZCVqZ3MiKnjLYp-VwSvtvTLkoVtJpAkA0gA=@r-v-e.co>
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

On Thu, 2025-06-12 at 08:25 +0000, Administrator @ R=C2=B7V=C2=B7E wrote:
> Thanks for your great hard work and efforts to mantain the various and no=
w
> considered exotic architectures running Debian, Adrian!

Thanks, and you're welcome. Unfortunately, some people like Finn and Eero d=
on't
appreciate these efforts and seem to think that this all comes at zero cost=
s.

Adrian

--=20
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer
`. `'   Physicist
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913
