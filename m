Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F212A1DD0F7
	for <linux-m68k@vger.kernel.org>; Fri, 25 Oct 2024 15:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.18.0.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729869492; cv=none; b=gNDSoGyguL1Jh2/AWhjhnfnqiMZ7G2BOfJ1r9LaDweCQ7+OeYjPLl+AcGMd8onbiih2Lsq831vUjTHtyc+q5vTJMmh+Er3Dk9Th4qNsIUD+solhFz5cMX2ggokTWVhYt+u8YoKsxiZ8kALrWCbVkcvg+lj5c6E68ctlufpNOXLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729869492; c=relaxed/simple;
	bh=QFByrHmABEQFsSfBmrf9Wu0R344iYNXNrRDX8b9nBLk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pNgX0a8wYsRnpPxXd/TPaUi8P1hZlpT94yVwy6npIFtK+NYS+Ewaf/Hc3Me4ohtVZf77ljHhmPEf3wAeL8TfM1CKyTLXoFDDrOE7UpFJaMltbQqX2HgaPb755NU+6636lWnMNRgQzoeVg9zR/GTyqkQ/EWRrw//JnzT7cwUtFzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=nefkom.net; arc=none smtp.client-ip=212.18.0.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nefkom.net
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4XZmP55fcbz1sBqH;
	Fri, 25 Oct 2024 17:07:53 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4XZmP52Vwdz1r96G;
	Fri, 25 Oct 2024 17:07:53 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id oHROdYqycZYI; Fri, 25 Oct 2024 17:07:52 +0200 (CEST)
X-Auth-Info: qGu4b6JXVneH8KHI8gnJJLFOKdGqHdlx7kREkUP9HjRF4S1AsI3fjVKJCRJzu51y
Received: from igel.home (aftr-82-135-83-33.dynamic.mnet-online.de [82.135.83.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 25 Oct 2024 17:07:52 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id 499072C19AF; Fri, 25 Oct 2024 17:07:52 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,  linux-m68k
 <linux-m68k@vger.kernel.org>,  debian-68k <debian-68k@lists.debian.org>,
  "James Le Cuirot" <chewi@aura-online.co.uk>,  "Sam James"
 <sam@gentoo.org>,  "Geert Uytterhoeven" <geert@linux-m68k.org>,  "Thorsten
 Glaser" <tg@mirbsd.de>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
In-Reply-To: <136f0492-fad7-4c75-b3c8-91ac7dc91570@app.fastmail.com> (Arnd
	Bergmann's message of "Fri, 25 Oct 2024 10:50:07 +0000")
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
	<383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com>
	<bfc235822cf8f773689abfefe1a75abfcf860c93.camel@physik.fu-berlin.de>
	<136f0492-fad7-4c75-b3c8-91ac7dc91570@app.fastmail.com>
X-Yow: But was he mature enough last night at the lesbian masquerade?
Date: Fri, 25 Oct 2024 17:07:52 +0200
Message-ID: <87ed441arb.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Okt 25 2024, Arnd Bergmann wrote:

> Doing it without a migration path seems worse to me,
> as this would mean breaking every single existing
> installation between two kernels, and making it impossible
> to bisect other issues, and breaking the rule #1.

That's why I didn't change the alignment when I implemented ELF.  It
would have made it impossible to mix an a.out kernel with ELF user
space, and vice versa.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
