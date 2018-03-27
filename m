From: "Lino Sanfilippo" <LinoSanfilippo@gmx.de>
Subject: Re: [PATCH] net: fec: set dma_coherent_mask
Date: Tue, 27 Mar 2018 15:24:34 +0200
Message-ID: <trinity-e93e9d10-7432-4fb0-a576-aeee9207df00-1522157074887@3c-app-gmx-bs61>
References: <1522071386-29743-1-git-send-email-gerg@linux-m68k.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1522071386-29743-1-git-send-email-gerg@linux-m68k.org>
Sender: netdev-owner@vger.kernel.org
Cc: netdev@vger.kernel.org, linux-m68k@vger.kernel.org, Greg Ungerer <gerg@linux-m68k.org>
List-Id: linux-m68k@vger.kernel.org

Hi,

>  
> +	dma_set_coherent_mask(&fep->pdev->dev, DMA_BIT_MASK(32));
> +
>  	for (i = 0; i < fep->num_tx_queues; i++) {
>  		txq = kzalloc(sizeof(*txq), GFP_KERNEL);
>  		if (!txq) {

dma_set_coherent_mask() can fail, so the return value should be checked and
a failure be handled accordingly.

Regards,
Lino
