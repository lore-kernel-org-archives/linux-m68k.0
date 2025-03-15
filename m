Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD0A202C4F
	for <linux-m68k@lists.linux-m68k.org>; Sat, 15 Mar 2025 14:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742050545; cv=none; b=BNyoZJQr/gXnntYnpV4/WSZ69W5K/QhEy7pVriKIIHI/GGdJBy+G553OB85967ihwy6H4Leo8nj+fNOSDkfK0+srQhLxCxcmiC5kkahmmqtcypmXGr5xHe71vilJKFpyQA9MYaGz3ZUV8IygQdPlfgi/8OXbsBZCFGYDsxvsRTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742050545; c=relaxed/simple;
	bh=XA99tfLBp8bXT73QYWUaMhUBMUYYGtyNQMBwQmFvmFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 Cc:Content-Type; b=aK6J8SL0vjQXG2E/2aLL0s6rWlMOxXFj5IeOu8aVYjYCUvqsFZyDOIqDGbAZpPXRkh6qvZFktxp5rih3fBGZgdJp8F6qejdu34XMI2eFAzzbUa/f2ZoSVohZotc2iiYTCept0Nfozuu1Q/ZV9oQmFSMLODX0KdR4e30VvK1cWNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e44oXhFc; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e44oXhFc"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-30155bbbeaeso769094a91.2
        for <linux-m68k@lists.linux-m68k.org>; Sat, 15 Mar 2025 07:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742050543; x=1742655343; darn=lists.linux-m68k.org;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XA99tfLBp8bXT73QYWUaMhUBMUYYGtyNQMBwQmFvmFg=;
        b=e44oXhFcWCaMH3K0DvVrU9l9QSVEiCmeQiWho9FHC59XGIOXeo6hrtdbQ6nKpNwyrL
         qQndwDgu2IZ3JiINI4/9gAx1BfR/v9TUf6nYEX6rMuAg9rEQzPBopMSrJxGiLI8pwqj6
         bWiKbKVyBAiRuqsf9bhtdEWG8kN4qQxmkhNkGRD7FgS/WkQ+WR2E1g1hqF1yQSbqi6D6
         cnlHu4c+A+VR9k79eiGbSVx6k4YQJD0Th9zilXZOUxaW1NTkHrhkuZ2U0yvR+McmjBTF
         m85vbhACb7rkBqVXw9ZHOAI7y1ejO7ajsroYVmMcgB6d4bI64stV+BlPdY8abLaSQCmK
         f4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742050543; x=1742655343;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XA99tfLBp8bXT73QYWUaMhUBMUYYGtyNQMBwQmFvmFg=;
        b=HT2XHF24wm4wU1idWwqmr1gM90uwuaTvJmJMps4NHPzuKbKzW0Cw/8vC2lEU5s+JO4
         tBet2gKTbobXfFHayPFp7h+OdgrNMtOm+PtByqyKfnAw0lijBRnHkMQYl8NfLjlnFDHT
         JkMHBtbchZA9XDm/9AvgjzITDsHPztBqV1HD9xLKE8ObP8f9vgRdHHbF1ZA7v9nZ3tU6
         jgL9ydAe7Z3iprS2/x+94FkcXY5X7pToyKV5sq3AXEMb1N4DZjStczzJ135fZvDreUH+
         tFWXPKb6jENqwMwXz9VjshZMd2Y+nDTmUvualICQqmAQ8WwMpjqPyU6vKiR+aw05Nldp
         n5Hg==
X-Forwarded-Encrypted: i=1; AJvYcCXZmugqCxSgTgCGQP7X+lDFjMC/WHYzhOoTaA7Vm5hqSsaHyOfTQGg71qfKYzllo8qjwjNoD5sCl6pM@lists.linux-m68k.org
X-Gm-Message-State: AOJu0YwWhvLfenuoUKg09CZOQq3UWnhs4kQ2hssbt31QP9Nme0gzJUiu
	v0E+iQcSpheQcdOfCzBCsu6jnQW9JoqrHdFxNu4FwVvfCcKlH/w4u6t1cSRIc8MxRuBLoaQyKP+
	da3xLxB7qVy1Hm4CxbIjRSW/C4kQ=
X-Gm-Gg: ASbGnctqqwg5iaTecd68xQcbJSULX1Yk8NO6gjju1C/ijmf11z6HUfOVorqhW8V91uC
	AUaGZuFWZcDxCmI/+K6CJTp1jjH6xvTaX8UL+NWOvWGiJZoY8idKm9niAozG7Gdo+Txh8X0Tz7u
	7tlygoCWFlF9HyJdqi1ijPR2M=
X-Received: by 2002:a17:90b:2e44:b0:2f9:d9fe:e72e with SMTP id
 98e67ed59e1d1-30151cc2490mt7920212a91.16.1742050543260; Sat, 15 Mar 2025
 07:55:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306185124.3147510-1-rppt@kernel.org> <20250306185124.3147510-11-rppt@kernel.org>
 <cee346ec-5fa5-4d0b-987b-413ee585dbaa@sirena.org.uk> <Z9CyRHewqfZlmgIo@shell.armlinux.org.uk>
 <Z9ErEBuMMvd6i2n9@kernel.org>
In-Reply-To: <Z9ErEBuMMvd6i2n9@kernel.org>
From: DiTBho Down in The Bunny hole <downinthebunnyhole@gmail.com>
Date: Sat, 15 Mar 2025 15:55:33 +0100
X-Gm-Features: AQ5f1Jrmv7KQRCuWBIo_vXTI9aIDRsZr_EQ5uQHAURWeudjXpiSlHPWiANvw4jg
Message-ID: <CAAZ8i80e6CsD1Y36-sVrVs4QPB-82J1gPOeDvHa_+sQtfUpMtQ@mail.gmail.com>
Subject: Soekris crypto 1411, where to find ?
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc <linux-parisc@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

hi
this is probably not the right place to ask, but I've been searching
eBay and similar places for 2 years and haven't found one yet.
I support older MIPS hardware and need to find a Soekris crypto 1411
miniPCI module or two, to add VPN acceleration.

Anyone have an idea where to buy it?

Soekris company went out of business years ago.

Let me know.
D.
