Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B494E433AD
	for <linux-m68k@lists.linux-m68k.org>; Sat,  8 Jun 2024 07:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.18.0.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717832591; cv=none; b=MpVEM+Lmo5PIaMM0z7tqT7WZ+u8sWp7TkITF8Z7vTimXoT87oNZU7eOJVEX7AEXBWBKN4DXbUT/kp8bKAy7DurKG323lLv0Nf2I0xzF/TaVM8coxKVmTCtjBVOMCOXnnZ+Oo1nelTChTZC7XQOQbCHKaPBEL2oKKUG0OCHSxu2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717832591; c=relaxed/simple;
	bh=7RauBA5INM1/M5jkultSeKWoUSOEhYDQMu9X6HJNCi8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SB2ZmCta3sUwSD2V9e9vbv4mdeM2hiotFpoNoqoAj9CxA8U2PGy/nRPoVpL5lK42R0eJ2Ihfnb+zDPIc5z3cq3uEZ61Qan4ThIn2IiKohV+ldPNHrA3kV/P+HklQdcyKgXdpArANv2I8pSHshjGa/p7/3lDCuWpqzGL1p7cBCKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=nefkom.net; arc=none smtp.client-ip=212.18.0.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nefkom.net
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4Vx8zS34YKz1sB74;
	Sat,  8 Jun 2024 09:37:24 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 4Vx8zS2dLGz1qqlW;
	Sat,  8 Jun 2024 09:37:24 +0200 (CEST)
X-Virus-Scanned: amavis at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavis, port 10024)
 with ESMTP id 16194_QW0FMb; Sat,  8 Jun 2024 09:37:23 +0200 (CEST)
X-Auth-Info: uaKg9FLjl5CfkwJYSp5EhjUVAfIwogfZgPg4mj/8QhSNJQcwpf+qw6teB+JxeOF/
Received: from tiger.home (aftr-82-135-83-222.dynamic.mnet-online.de [82.135.83.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sat,  8 Jun 2024 09:37:23 +0200 (CEST)
Received: by tiger.home (Postfix, from userid 1000)
	id 1445429B296; Sat,  8 Jun 2024 09:37:23 +0200 (CEST)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Michael Schmitz <schmitzmic@gmail.com>
Cc: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,  Greg Ungerer
 <gerg@kernel.org>,  linux-m68k@lists.linux-m68k.org,  geert@linux-m68k.org
Subject: Re: m54418: ELF execution issues
In-Reply-To: <2f52ce9a-2083-7e4d-21e1-204e13d3e8e3@gmail.com> (Michael
	Schmitz's message of "Sat, 8 Jun 2024 14:15:22 +1200")
References: <68ec857f-a559-4f71-87ba-425b4ee7c9c7@yoseli.org>
	<d18dab84-f6d8-4732-88cb-8b95bd4487f3@gmail.com>
	<45745b6a-341c-4f9c-8787-6154393d1223@yoseli.org>
	<82ba7ea3-d290-494c-b3e3-93d9dc7c6c0d@yoseli.org>
	<85e2ecc5-d334-4c83-8209-19e0c1c71812@kernel.org>
	<49a0c20c-586a-4762-b80a-ddc59cc511ed@yoseli.org>
	<2f52ce9a-2083-7e4d-21e1-204e13d3e8e3@gmail.com>
X-Yow: I've read SEVEN MILLION books!!
Date: Sat, 08 Jun 2024 09:37:23 +0200
Message-ID: <878qzfopfw.fsf@linux-m68k.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Jun 08 2024, Michael Schmitz wrote:

> TASK_SIZE, TASK_UNMAPPED_BASE and ELF_ET_DYN_BASE all appear related
> according to rules that I haven't found spelled out anywhere.

There is only one rule: TASK_UNMAPPED_BASE and ELF_ET_DYN_BASE must be
smaller than TASK_SIZE.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
