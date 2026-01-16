Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C15D23EA86
	for <linux-m68k@lists.linux-m68k.org>; Fri, 16 Jan 2026 13:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768568703; cv=none; b=nkobKHHbdu3HvEtC202wkf1Bx39vePyBMESauZCKb2xTLMlwhkJ2i5HU8OMMHs/Grt8TNFRjQi2BPSLmKJvIXDZHFTp8bRDtPt9DDu8xaNeZOZCcarr75Iy8zbwGDBFhlIVvtDy7eoUVWZPoZogHl4vu2kvfgA6wYac6ODPpvvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768568703; c=relaxed/simple;
	bh=CbAFMWQxaWN4gPfzGHNuSzDAtPQQxKBaf65k7R7yp5g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TVaf5IzP7woXs+10B5b9as82KWeoCTcPgVZOHjZH+0d1qSrTPNWAeW/6EmvAsGa8w2aFE+tcDSgc70PVMiw8/a18C29Wtsdpv2cBuQVetN0sJ9F4G2dleXvmmuz35iolUpWiCfwW4CXnjnUF2xBV4LeOlLlI0mtLqURrr8hLpFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gZ+NFJvB; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gZ+NFJvB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768568700; x=1800104700;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=CbAFMWQxaWN4gPfzGHNuSzDAtPQQxKBaf65k7R7yp5g=;
  b=gZ+NFJvBmbwj+HuoIL14smUPAgK7hZjZlQTTDrXJDgQbAyyHA5z8imHW
   bSpoxoUSN6gPgsglx3R7hpkTKtI6pet9ww8VKX+gNnJdnfGyf27z/2cIs
   zxb5M9fKCja2+gmkBnEOL9YCmwlnQ4VEuMTHSBB9IM6m2/+2XCYcDEeXQ
   RyVQVzrax0W7X3WfwTuAbUmnQ8d8ntSa4qKxvFdlvHiL5JT98470uNDT6
   IgD9wA7ds7mU+l4qvKwRNp6SghLULjCNYaKazAODvtkpNmY8Cfvw9grZ/
   +67p8hOyjD0QaZnYTCfIgVAn022zbjivH0AxXnsEUm7q4tMwDX+v/8Y5J
   Q==;
X-CSE-ConnectionGUID: dBkzckfSQqOffXDvzCDtbQ==
X-CSE-MsgGUID: CCbByscTQMS19j4LKEvCPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="68892484"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="68892484"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 05:04:56 -0800
X-CSE-ConnectionGUID: KQRblK2aQjW0DOA9Jboafg==
X-CSE-MsgGUID: pX6S6faKQwuORaUhAmfo+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="209733228"
Received: from black.igk.intel.com (HELO black) ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 05:04:48 -0800
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>, Richard Weinberger
 <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes
 Berg <johannes@sipsolutions.net>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>, Douglas Anderson
 <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, John Ogness <john.ogness@linutronix.de>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, Jiri Slaby <jirislaby@kernel.org>,
 Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Kees Cook
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Andreas Larsson
 <andreas@gaisler.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Laurentiu
 Tudor <laurentiu.tudor@nxp.com>
Cc: linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org,
 netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Marcos Paulo de Souza <mpdesouza@suse.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>
Subject: Re: [PATCH 14/19] drivers: hwtracing: stm: console.c: Migrate to
 register_console_force helper
In-Reply-To: <20251227-printk-cleanup-part3-v1-14-21a291bcf197@suse.com>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-14-21a291bcf197@suse.com>
Date: Fri, 16 Jan 2026 14:04:45 +0100
Message-ID: <83zf6daetu.fsf@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Marcos Paulo de Souza <mpdesouza@suse.com> writes:

> The register_console_force function was introduced to register consoles
> even on the presence of default consoles, replacing the CON_ENABLE flag
> that was forcing the same behavior.
>
> No functional changes.
>
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

Acked-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>

Should I pick this up or will you send this with the rest of the series?

Cheers,
--
Alex
