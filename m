Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E49481CE
	for <linux-m68k@lists.linux-m68k.org>; Wed, 25 Sep 2024 17:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.18.0.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727284430; cv=none; b=qQZa+dbiLSmrSiQBoZgbAyLAbwAFqfaoKx43f52VAWcEhl9NPJbG/fjaeR4t4FqB+ctjyt1y5oOnZgt9HzDTBohUxEd0PzxkcJquJ3C4g4/hahNXKygZY0d5lNNhADc5PoFVVrttKrUwy0/uq2qxhlhxTxOMQeERE3NP1k6xilM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727284430; c=relaxed/simple;
	bh=gTVOO+x9Y7oPgLbbH7bzS8lNXQibWxzPAKJ0EEcSiwg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jp8Qh216VCYPn/jYV2mhRNlH23fl+j+CoH4btuC5thA/CnV1MNVAGBAz8fAmcuoQ8IrRPfWHEp1uprs/Tq51P330h+9Qf+DuPKrhHhAuhWLJdztN94Nhe6YXct1gcbOoG6hCZ7BrtFTpM0PN7WlJYGuZ/Z3OmmAw47uIWOyt+zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=nefkom.net; arc=none smtp.client-ip=212.18.0.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nefkom.net
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4XDNc61JdYz1s95F;
	Wed, 25 Sep 2024 19:13:42 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4XDNc56wFgz1qqlS;
	Wed, 25 Sep 2024 19:13:41 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id g8u3XRVxkJPz; Wed, 25 Sep 2024 19:13:40 +0200 (CEST)
X-Auth-Info: jeleWnYl8mNkHCNbhRIJtw4BZCyDDwd0ahalZr0dm9vmXvMJ3Gbb5LopOhy+mFSF
Received: from igel.home (aftr-62-216-205-55.dynamic.mnet-online.de [62.216.205.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Wed, 25 Sep 2024 19:13:40 +0200 (CEST)
Received: by igel.home (Postfix, from userid 1000)
	id 622052C1A09; Wed, 25 Sep 2024 19:13:18 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Eero Tamminen <oak@helsinkinet.fi>
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>
Subject: Re: [PATCH 1/2] m68k: Drop Atari EtherNAT support when it's not
 configured in
In-Reply-To: <fff20dd3-d82b-4095-b367-1aaf118ef8a0@helsinkinet.fi> (Eero
	Tamminen's message of "Wed, 25 Sep 2024 02:11:45 +0300")
References: <20240922214821.16818-1-oak@helsinkinet.fi>
	<4540348c-84f6-4993-97b5-f007771be444@gmail.com>
	<eed880a2-8c02-40d7-813b-c6e8f1b8c197@helsinkinet.fi>
	<877cb03gju.fsf@igel.home>
	<fff20dd3-d82b-4095-b367-1aaf118ef8a0@helsinkinet.fi>
X-Yow: I want to dress you up as TALLULAH BANKHEAD and cover you with
 VASELINE and WHEAT THINS..
Date: Wed, 25 Sep 2024 19:13:18 +0200
Message-ID: <87y13f3bdd.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sep 25 2024, Eero Tamminen wrote:

> Hatari debugger backtrace does not rely on frame pointers or stack content
> unwinding, i.e. it's immune to stack corruption.

That has nothing to do with stack corruption.  Valid user-space
addresses can very well happen to match kernel adresses, since the
address spaces overlap.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
