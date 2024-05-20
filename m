Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F32813848B
	for <linux-m68k@lists.linux-m68k.org>; Mon, 20 May 2024 21:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.18.0.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716240148; cv=none; b=XBQS2fPYfvcSmNdwqw8Rn79fSsZONCItIRdBbkOOI9Hizd5DzhWpV6nVxmI4thGK+fnDOZk1ARiaOLcaiMsvu48Lb4/C1VbpmbFei6gOvMay+S7wdPuE5/pTwxJ45fNFEdikWkyzdMnUG81SScUvhyh9ehDhk7PNYkN8/RyLwhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716240148; c=relaxed/simple;
	bh=Ql4/S/MNx9ytVD+83v244/A3s3msuBU+srHQbOmBiBA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pkZs2a66Y1uNp9lx/OGFsFQ2932xRJNaYClABY+cR0O8TcQiJ5ZsQTUBOcl+BecHEsL1RQuDOLMGjvXtjwvRXy5rohYocStdqK9tjeJ9znBkZLyGiyCdnH8z24J9NyhzHYCHIYA/AoUSwZR4r6Udwi1UFBlaWim8zDmzfTNooEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=nefkom.net; arc=none smtp.client-ip=212.18.0.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nefkom.net
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4Vjr2657Gnz1qsPQ;
	Mon, 20 May 2024 23:15:26 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4Vjr264KZLz1qqlS;
	Mon, 20 May 2024 23:15:26 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id S6eBxFTWqYFl; Mon, 20 May 2024 23:15:25 +0200 (CEST)
X-Auth-Info: ER6Ycm6BZvlBeMYou70/R4CipIKR+Hmkh4dOGr1tOBzgiMHV3ewkf6ZDc+rnvKIK
Received: from igel.home (aftr-82-135-83-66.dynamic.mnet-online.de [82.135.83.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 20 May 2024 23:15:25 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id 89D272C00BC; Mon, 20 May 2024 23:15:25 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Paolo Pisati <p.pisati@gmail.com>,  Geert Uytterhoeven
 <geert@linux-m68k.org>,  linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: Amiga, serial and SYSRQ
In-Reply-To: <3f1fc752-52c1-4b00-aaef-b917be083718@gmail.com> (Michael
	Schmitz's message of "Tue, 21 May 2024 09:01:06 +1200")
References: <ZkjwzVwYeQtyAPrL@amaterasu.local>
	<CAMuHMdXnsXk+MuGUCnPcQVbOdSGJAHiK6TBZE2r5_h15qs_azg@mail.gmail.com>
	<ZkuFrTQDw6iM9Z7K@amaterasu.local>
	<3f1fc752-52c1-4b00-aaef-b917be083718@gmail.com>
X-Yow: Is this TERMINAL fun?
Date: Mon, 20 May 2024 23:15:25 +0200
Message-ID: <874jasfamq.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mai 21 2024, Michael Schmitz wrote:

> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7 is what I have set in my builds.

Which is also the default.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
