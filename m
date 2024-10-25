Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C652B217F30
	for <linux-m68k@vger.kernel.org>; Fri, 25 Oct 2024 22:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.18.0.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729895103; cv=none; b=Co7MjiWK0vbTorXsS64hL+PaZe8gYTyPrEjZo8Mdm5jJrdnMBdcOlaaFVv5BHcyuFTCUaN4IdCrvUfvgkeei8Ljw68FC+INsq1RSrViomDwhDlZSx7ccCzf6J4vkz1jtQD39l9biB0rnmUUuAas5j7E66SOxDPerIosj+rUQJ1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729895103; c=relaxed/simple;
	bh=ptD6OH0MGHW4Shh1DWEeV0k1mRSqYyHLG4EXa+TSjbE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iHaXnnmZt1zzOBwoq5nlGtjYwOXcVFFj8cHfg0CzdSaTfXusGIAjSOUIy/vcxIDpuSCjQZxT8BiesftTaPWueD+GRuDibzjQhNYzwlIDewfs5v+HZxKO7F5q3qpZ530OV/3tJbqYzGfsuMVB+45zC/9uHCa5s5bnKMJxPkSHGrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=nefkom.net; arc=none smtp.client-ip=212.18.0.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nefkom.net
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4XZy5M1pvrz1sCHF;
	Sat, 26 Oct 2024 00:24:54 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4XZy5L4yDTz1rZyt;
	Sat, 26 Oct 2024 00:24:54 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id KbN1Itb8ZKrD; Sat, 26 Oct 2024 00:24:53 +0200 (CEST)
X-Auth-Info: lGu6kyo7QS0ahTaUFUYE2+yaywMCyxysmyYYlG4UrCJuXrfHlm8lf6L4HdAWgwSK
Received: from igel.home (aftr-82-135-83-33.dynamic.mnet-online.de [82.135.83.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sat, 26 Oct 2024 00:24:53 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id A1FF42C1827; Sat, 26 Oct 2024 00:24:53 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Thorsten Glaser <tg@debian.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,  Arnd Bergmann
 <arnd@arndb.de>,  linux-m68k <linux-m68k@vger.kernel.org>,  debian-68k
 <debian-68k@lists.debian.org>,  James Le Cuirot <chewi@aura-online.co.uk>,
  Sam James <sam@gentoo.org>,  Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Plan needed for switching m68k to 32-bit alignment
In-Reply-To: <97b0a5de-885f-ffde-3739-f7f29b16d3bd@mirbsd.de> (Thorsten
	Glaser's message of "Fri, 25 Oct 2024 23:38:45 +0200 (CEST)")
References: <3a5e171bf42e5273eb8235cba04e8328b19c2ca4.camel@physik.fu-berlin.de>
	<383faec7-8987-4680-920d-8f802e1bea34@app.fastmail.com>
	<bfc235822cf8f773689abfefe1a75abfcf860c93.camel@physik.fu-berlin.de>
	<97b0a5de-885f-ffde-3739-f7f29b16d3bd@mirbsd.de>
X-Yow: Yow!  Are you the self-frying president?
Date: Sat, 26 Oct 2024 00:24:53 +0200
Message-ID: <874j4z253e.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Okt 25 2024, Thorsten Glaser wrote:

> Question is, do we need a kernel change for this at all?
> Is there anything in the kernel/userland interface that
> gets affected by this, or do these APIs use sufficient
> explicit padding? Has anyone looked at this?

Already basic things like struct stat64 will break.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
