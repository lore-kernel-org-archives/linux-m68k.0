Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AEE4BFE6A
	for <linux-m68k@lists.linux-m68k.org>; Wed, 23 Sep 2026 11:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.105.4.254
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790164614; cv=none; b=mdeFqu05FavttY1M2OrnTtiFzlsiRLxV9Y1EBysi2iuxy3Qpgr1Uv0dVGUOfsXa70GDpZdDVmixX7o7pgAMo5f+keMpUY+y9V6VR35PuE3E0tBF01x87hkyFBkn9IRkoLXV6o3Uh83fK5BlBF2BxfqbfTWDnqMNzx0PoQUTJBJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790164614; c=relaxed/simple;
	bh=44ICWnorrCS43CkKDydTCwnSTJP909YuCfvv09dlXRw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Tvc9DVjlVcZjD7HFbE50HR7w089mPvK9iAa0lY7jAACoPwfkNNG+Os5NeL5Liz1MjgCwfhhtrMYUy6pycsZuW/koKWyKGT96zfUQGLQp9UjFvTs/hykNTRLiK+qCY+G14qiU05wM0lAjH09AtiD/TTmk+BQqFbofPzwqNT3Eap4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=kernel.org; arc=none smtp.client-ip=172.105.4.254
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 259B1600AA;
	Wed, 23 Sep 2026 11:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A841F00893;
	Wed, 23 Sep 2026 11:56:46 +0000 (UTC)
Message-ID: <5cec8deb-bf42-451b-b37b-0a7d1df39bf1@linux-m68k.org>
Date: Wed, 23 Sep 2026 21:56:45 +1000
Precedence: bulk
X-Mailing-List: linux-m68k@vger.kernel.org
List-Id: <linux-m68k.vger.kernel.org>
List-Subscribe: <mailto:linux-m68k+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-m68k+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: remove unused <asm/quicc_simple.h> header
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 linux-m68k@lists.linux-m68k.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20260918034219.520193-1-enelsonmoore@gmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20260918034219.520193-1-enelsonmoore@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ethan,

On 18/9/26 13:42, Ethan Nelson-Moore wrote:
> arch/m68k/include/asm/quicc_simple.h has been unused since
> commit a3595962d824 ("m68knommu: remove obsolete 68360 support").
> Remove it.
> 
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>

Looks good, and since this is related to m68knommu I will push this into
the m68knommu git tree for-next branch.

Thanks
Greg



> ---
>  arch/m68k/include/asm/quicc_simple.h | 53 ----------------------------
>  1 file changed, 53 deletions(-)
>  delete mode 100644 arch/m68k/include/asm/quicc_simple.h
> 
> diff --git a/arch/m68k/include/asm/quicc_simple.h b/arch/m68k/include/asm/quicc_simple.h
> deleted file mode 100644
> index b9e2808b44ac..000000000000
> --- a/arch/m68k/include/asm/quicc_simple.h
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/***********************************
> - * $Id: quicc_simple.h,v 1.1 2002/03/02 15:01:10 gerg Exp $
> - ***********************************
> - *
> - ***************************************
> - * Simple drivers common header
> - ***************************************
> - */
> -
> -#ifndef __SIMPLE_H
> -#define __SIMPLE_H
> -
> -/* #include "quicc.h" */
> -
> -#define GLB_SCC_0   0
> -#define GLB_SCC_1   1
> -#define GLB_SCC_2   2
> -#define GLB_SCC_3   3
> -
> -typedef void (int_routine)(unsigned short interrupt_event);
> -typedef int_routine *int_routine_ptr; 
> -typedef void *(alloc_routine)(int length);
> -typedef void (free_routine)(int scc_num, int channel_num, void *buf);
> -typedef void (store_rx_buffer_routine)(int scc_num, int channel_num, void *buff, int length);
> -typedef int  (handle_tx_error_routine)(int scc_num, int channel_num, QUICC_BD *tbd);
> -typedef void (handle_rx_error_routine)(int scc_num, int channel_num, QUICC_BD *rbd);
> -typedef void (handle_lost_error_routine)(int scc_num, int channel_num);
> -
> -/* user defined functions for global errors */
> -typedef void (handle_glob_overrun_routine)(int scc_number);
> -typedef void (handle_glob_underrun_routine)(int scc_number);
> -typedef void (glob_intr_q_overflow_routine)(int scc_number);
> -
> -/*
> - * General initialization and command routines
> - */
> -void quicc_issue_cmd (unsigned short cmd, int scc_num);
> -void quicc_init(void);
> -void quicc_scc_init(int scc_number, int number_of_rx_buf, int number_of_tx_buf);
> -void quicc_smc_init(int smc_number, int number_of_rx_buf, int number_of_tx_buf);
> -void quicc_scc_start(int scc_num);
> -void quicc_scc_loopback(int scc_num);
> -
> -/* Interrupt enable/disable routines for critical pieces of code*/
> -unsigned short  IntrDis(void);
> -void            IntrEna(unsigned short old_sr);
> -
> -/* For debugging */
> -void print_rbd(int scc_num);
> -void print_tbd(int scc_num);
> -
> -#endif

