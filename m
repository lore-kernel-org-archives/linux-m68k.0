Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3746343D86
	for <linux-m68k@lists.linux-m68k.org>; Fri,  3 Jul 2026 11:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783078680; cv=none; b=AhfaGCkArai1qgJTO6h8dIeo4l5JwFTHlooUCjJbmcIzv5kzyjbdhMDPAPtbox129yStlSPENNC5coawRg8dxqUtRY5TIASmXaC0lfEq0yyFS5PcXQC9AcacOF4V6b4Jm3dMWFl+sTa92uQaoSIQHX0eQUEV7lhCLr+v+YkBhLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783078680; c=relaxed/simple;
	bh=UdrLlKa9TZUre5Va31uaPVxpw/dKVTtkgfVpvxkVSwY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JPa1dx6mpDB36lUB0o5B6K/8Zs06cJeEmbhlhDdU9uyHUs9qz2pKX7SM/rPqgpd19lJhuE7vRijgZk4TRI6VbLH8jQBhxvptGssgoMqvJFDjHVyQKhF94cseJAFOwCYvGhIstHxms7RxHAB+KAP7ocXpwucyxgK4mXDYZBvdSDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=T0olp4BW; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="T0olp4BW"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 128E3C79ABE;
	Fri,  3 Jul 2026 11:38:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 47CE660300;
	Fri,  3 Jul 2026 11:37:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 69BCB104C948C;
	Fri,  3 Jul 2026 13:37:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783078676; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UG+zoCgKPEafKRYJiQQaqScXAazAfh69SykFGcgr/A4=;
	b=T0olp4BWSqvPj19tQuYezFaQIFkeDO8uatlBlmcFjda6F3hlgchYay/CLWUAG43Mb4uPX+
	jRruOug1LwBwWM7d6KH7bEFxG+Ebiab29OrsYMLp1WKN1+5DiqGMZPAL5vXyoWqmmTXjEW
	bkfFOG26I7ZlUxsOZ9eyAta68Rz15VwfZX5WbCR3q73NU9keH/S2jE/FBIwBgp5GY8m4Wc
	eoOiqSGka7s8QtaLvMZ+W3Yvnl6cfpwhP19ULAJo2Q27TcPH7GFcxEeUG1THvARPHdeKk8
	69iV8Pcl8OiPnegCHS6+Mqa3fuo5bsLyzC91QqQbDsJVJ4ADb8EBxlG72MYNXw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Greg Ungerer" <gregungerer@westnet.com.au>,  "Arnd Bergmann"
 <arnd@kernel.org>,  "Richard Weinberger" <richard@nod.at>,  "Vignesh
 Raghavendra" <vigneshr@ti.com>,  "Randy Dunlap" <rdunlap@infradead.org>,
  "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
  linux-kernel@vger.kernel.org,  linux-mtd@lists.infradead.org,  linux-m68k
 <linux-m68k@lists.linux-m68k.org>,  "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Subject: Re: [PATCH 2/3] mtd: maps: remove uclinux map driver
In-Reply-To: <f3e984cd-0614-48d1-b03f-e0670b87e282@app.fastmail.com> (Arnd
	Bergmann's message of "Thu, 25 Jun 2026 16:10:54 +0200")
References: <20260526103227.3152003-1-arnd@kernel.org>
	<20260526103227.3152003-2-arnd@kernel.org>
	<b55ac37f-4523-46d0-8e77-3a17d7235ffe@westnet.com.au>
	<f3e984cd-0614-48d1-b03f-e0670b87e282@app.fastmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 03 Jul 2026 13:37:51 +0200
Message-ID: <871pdknw1c.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello,

>> Can we get this reverted?
>
> Yes, of course. Miquel/Richard/Vignesh, should I send a revert or
> can you just apply one with Greg's explanation and my Ack?
>
>      Arnd

Just sent a revert, I hope I got it all right.

Link: https://lore.kernel.org/linux-mtd/20260703-perso-revert-uclinux-map-v=
1-1-2b7d46f20465@bootlin.com/T/#u

Cheers,
Miqu=C3=A8l
