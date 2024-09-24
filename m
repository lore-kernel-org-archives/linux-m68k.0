Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CAD7137776
	for <linux-m68k@lists.linux-m68k.org>; Tue, 24 Sep 2024 19:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727206274; cv=none; b=qamNQLHHK3Wuew63iAYIiDbCYoIYlHK2O0LPqzOwMy+udDQzQwDPp9jez4Hq3vT0/UriResSZmjNESrGny8VxX4v0dgpA2WYAeCASuJu7cVe5r8rCf5xkuyODwSQxns6fLQRYKcFcpr0GeDI4OIgWrWwx1nJGPv0hyrAPTHDR/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727206274; c=relaxed/simple;
	bh=uuVl6MBaXlHZbPcy1TEcgr1GjBMcSriG1UXSxHvSc/Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=exWcI5N3PimotaxFQk2dMg/GseAEN0UgayApOTN16QK2zYBLS/jePoZxBggng8a/9HYW9/YfUh9dEKfcro3IXtCHriDkgUDDJA/uu3kbeJtTOa4uPU/9uW8/YRNv5YfmwGV3l7cDc3XGV8mH02pHGrTt/10gJrOC3ftHaGUKYVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 2EEB292009C; Tue, 24 Sep 2024 21:23:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 2083292009B;
	Tue, 24 Sep 2024 20:23:21 +0100 (BST)
Date: Tue, 24 Sep 2024 20:23:21 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: David Hildenbrand <david@redhat.com>
cc: Guenter Roeck <linux@roeck-us.net>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
    linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v2] m68k: Define NR_CPUS
In-Reply-To: <65959acc-c59b-4aca-8ab4-5d0603d22110@redhat.com>
Message-ID: <alpine.DEB.2.21.2409242018160.3358@angie.orcam.me.uk>
References: <20240923235617.1584056-1-linux@roeck-us.net> <aa23abe3-7236-4b9e-b237-3b822ac9d186@redhat.com> <CAMuHMdVEfPtwps0A29WvHcwgo3f+3nTBiGn1PFxoYy1dxPsUMA@mail.gmail.com> <bf98fa37-461f-47ce-8d4c-bcb69f225a9c@roeck-us.net>
 <65959acc-c59b-4aca-8ab4-5d0603d22110@redhat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Sep 2024, David Hildenbrand wrote:

> diff --git a/mm/Kconfig b/mm/Kconfig
> index 09aebca1cae3..4c9f5ea13271 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -595,6 +595,7 @@ config ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
>  config SPLIT_PTE_PTLOCKS
>         def_bool y
>         depends on MMU
> +       depends on SMP
>         depends on NR_CPUS >= 4

 I think it might be more intuitive if written as:

	depends on SMP && NR_CPUS >= 4

(with a note in the change description to the effect that NR_CPUS will 
have been unset and the condition won't work as expected unless SMP).

 FWIW,

  Maciej
