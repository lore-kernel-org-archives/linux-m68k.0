Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AAB2594BB
	for <linux-m68k@lists.linux-m68k.org>; Mon, 30 Dec 2024 11:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.18.0.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735557754; cv=none; b=QjaqOVdfyX9l1t0T5NO5BF/Dz6kentVe5FPHygLjXsG+Ap0HmpTCI6bWdmUDHPRXddiOMtvz13W12R1lG14Ai9X6X2ckYfjJVOIvlgdKWfcmgxXVVy0Q8zzxik6MU3KUKRzDQ3G2Ug488FmLo4dN0AMLGsyd3t6cQPHsM5OkiKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735557754; c=relaxed/simple;
	bh=3OiodtWbncpCsJQW8Ba8mzo+dqtfKLaeQOBzANxL8+c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=O+KmjQOERniiN/T01nTnKHS3vmY0+UC2+gwRB2eRQbK5zPjgZQUb7gh9ni+hhlhq4pq3pGRvROHp3gAfvPrgzMIfMvYhf5md3wYdES3G0f0h3d4UQZlnTkZQA5UNZASJ5UNFVNVT1+tX9n08pJoBy1ORJK0lrawk52qU1gLM200=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=nefkom.net; arc=none smtp.client-ip=212.18.0.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nefkom.net
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4YMDGQ189lz1r1sY;
	Mon, 30 Dec 2024 12:22:22 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4YMDGQ04QTz1qqlS;
	Mon, 30 Dec 2024 12:22:21 +0100 (CET)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id T6GW-CNCLYp3; Mon, 30 Dec 2024 12:22:21 +0100 (CET)
X-Auth-Info: vx3HGq6m/ZbPvGgQhxfc3ohYn2VwzZnYS0I+obIyfSM6K4b/wKbDgN+bMk8Q20fI
Received: from igel.home (aftr-82-135-83-167.dynamic.mnet-online.de [82.135.83.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 30 Dec 2024 12:22:21 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
	id 0F6D82C2205; Mon, 30 Dec 2024 12:22:21 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Finn Thain <fthain@linux-m68k.org>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  linux-m68k@lists.linux-m68k.org
Subject: Re: Build issue "Error: operands mismatch -- statement `movec
 %d2,%caar' ignored" on m68k
In-Reply-To: <CAMuHMdWmYc4=-ZbFoNrD=2CjucxdUSqhfufJZ_UkL+wvun_jcg@mail.gmail.com>
	(Geert Uytterhoeven's message of "Mon, 30 Dec 2024 09:53:29 +0100")
References: <20241229134848.0a1d9719@windsurf>
	<CAMuHMdU-DB1kOymg3-E4nRN_8R8N_R3wVZq7MNYUGsQWLa3hrg@mail.gmail.com>
	<e30ab951-bdb6-09f1-0d3b-9a09220babe7@linux-m68k.org>
	<CAMuHMdWmYc4=-ZbFoNrD=2CjucxdUSqhfufJZ_UkL+wvun_jcg@mail.gmail.com>
X-Yow: I haven't been married in over six years, but we had sexual counseling
 every day from Oral Roberts!!
Date: Mon, 30 Dec 2024 12:22:21 +0100
Message-ID: <877c7hjtzm.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Dez 30 2024, Geert Uytterhoeven wrote:

> Conclusion: make sure your toolchain supports (a superset of) the
> CPUs supported by your kernel config.

Conclusion: always use .chip directives.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
