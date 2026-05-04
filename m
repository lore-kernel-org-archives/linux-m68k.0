Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F0A37B3F4
	for <linux-m68k@lists.linux-m68k.org>; Mon,  4 May 2026 23:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777937981; cv=none; b=OLqRyQGkElmgbi69WpB28qDDhaCwUqRyi+cj4dWmJKUn6n8uT4VlWucjMSV6natSlkYe1TTW4q6vcWk8pawGA6prIOLV35foQfxpiW9ZiS+ZEPxAYjrGe53biOn+W9C0mu5cPt4k4fmAbHpXGV/83+A0CStc4Z7dlNM3pLzAofM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777937981; c=relaxed/simple;
	bh=P2SUSSAz+n1zU+FJu7zVncwnH7gkVtMiCUcdbjGXdsg=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=f4RXwsbL8PMG6KTWU6gn/3pTsREsMgdwK5Lzu3amJsgElROpE7kTegBvqQksRZyU/vhnGnyoVNsGCrPSJ3E6U7tMIE59BQWtls6RIVgkhvTKKzfqzRTU3cs5/M5arO7TLk18lk+ZCwhPUkwrWDZ0vstCuO5JNI7go9V0L9PZBN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LeDlM+Be; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LeDlM+Be"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A6E7F1400088;
	Mon,  4 May 2026 19:39:38 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 04 May 2026 19:39:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1777937978; x=1778024378; bh=khf5yKKdt+gtNrRBMm0Mq2FAuZDU2vTpn6/
	ep7G46dI=; b=LeDlM+BezM7q6O7oq6J6baOMNceksTXtVeMkaZR6YwnK9UsoKIf
	JjDBlyP5bwsuUtm4ar0N16n4gMboQdeBGjX2F28dZzjd7UIEKKERLI0Zy/kXjeAC
	F52OWCaEWJt9IiUlgA1mt66WNHxAkWANEcDTGwbMwH00CA/MqR0jwOpxBzgfrYUi
	ZCGwL/oHfNoyypGTf5XWC00DEPls/HMt7npOI70nTH0bKAePt3XVe5Moh5PiWeES
	RhmDJGMvFUxlIq8lD0ihGdPK/NhtUdI5ABaGLg8MH4gIozkYnNhAGUOJa2USyY2H
	LaEPpjhz3iluEEzfDuv99XV1kVJdAdOV6FQ==
X-ME-Sender: <xms:Oi75aVcF-l6B9zRU0P1ncS1hEt5WcuFiIlOye8BXo-fVQv0NnKLoow>
    <xme:Oi75aa_zPlgHH8rIV-3eGorcRjAR3gkhX47pIDpL52MJTJbbJfmZj9ItIz8uuBk75
    M36cA-9k0Ze_NSuGi5zw50ro0aXBIaW5jWnt7cE9Z2dpTW-E1x-F6I>
X-ME-Received: <xmr:Oi75aRl3cvOr39Rshca1ywOcwdjL5tShXhEP3F2Q74JDDelqIbDcrWMoD3z3U1QrRrsiwaKP7qXw6WlIjQo07C2KuMozai_PaAU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutddtudekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhh
    rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
    gvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeuheeu
    leenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfth
    hhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeefpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehjohhhrghnsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehlihhnuhigqdhmieekkheslhhishhtshdrlhhinhhugidqmheikehkrdho
    rhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrd
    horhhg
X-ME-Proxy: <xmx:Oi75ac-sWgKkNuakdb-fb1gk9d1EIDOOmCvuYld7R_jYLcw2r3ln5A>
    <xmx:Oi75afmXhLahQL_i62PMnA2DTZEp8agTq799ll5bnZRduLF6NJ2UKA>
    <xmx:Oi75aZ0ruUERZIwQZQKa4A_619CuhWjljNjVyTJ2_ZFq75IWjTPQOA>
    <xmx:Oi75aaqtrCGNWgXZx2zPafouUXj1Tb7hNaYh_ecwdrzyctW_v9OoaQ>
    <xmx:Oi75aRQ_1P27mqiwfMBRqMELv17DtjX-bjHJoqolxL7VSticfYRTnxRt>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 May 2026 19:39:35 -0400 (EDT)
Date: Tue, 5 May 2026 09:39:35 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Johan Hovold <johan@kernel.org>
cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nubus: switch to dynamic root device
In-Reply-To: <afhu9r_x40aeLgvS@hovoldconsulting.com>
Message-ID: <bb9deb45-33ab-a4f5-f59e-f17d0fc0a419@linux-m68k.org>
References: <20260424104011.2616970-1-johan@kernel.org> <92e2b920-041a-78a4-e4b6-c5a7c579ade7@linux-m68k.org> <ae-BCxxLFkzEvw63@hovoldconsulting.com> <a05b0f75-87b8-5478-3480-be545c905c83@linux-m68k.org> <afhu9r_x40aeLgvS@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Mon, 4 May 2026, Johan Hovold wrote:

> 
> the aim is to git rid of statically allocated device structures
> 

Indeed, and the aim of the commit log is to provide some rationale. When I 
reviewed your patch I found that it was missing. Like I said to you 
already, the nubus parent device is a singleton (just like the ISA parent 
device).

