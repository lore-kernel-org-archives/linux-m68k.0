From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v9 4/4] dmaengine: fsl-edma: add ColdFire mcf5441x edma
 support
Date: Sun, 12 Aug 2018 15:24:35 +0200
Message-ID: <CAJKOXPeb9pYssvhYFnRMTn4r8vK4AtR8TQCR45po9=0491z44g@mail.gmail.com>
References: <20180811112649.20752-1-angelo@sysam.it>
 <20180811112649.20752-4-angelo@sysam.it>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180811112649.20752-4-angelo@sysam.it>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Angelo Dureghello <angelo@sysam.it>
Cc: dmaengine@vger.kernel.org, Stefan Agner <stefan@agner.ch>, linux-m68k@vger.kernel.org, vinod.koul@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-m68k@vger.kernel.org

On 11 August 2018 at 13:26, Angelo Dureghello <angelo@sysam.it> wrote:
> This patch adds support for ColdFire mcf5441x-family edma
> module.
>
> The ColdFire edma module is slightly different from fsl-edma,
> so a new driver is added. But most of the code is common
> between fsl-edma and mcf-edma so it has been collected into a
> separate common module fsl-edma-common (patch 1/3).
>
> Signed-off-by: Angelo Dureghello <angelo@sysam.it>
> ---
> Changes for v8:
> - patch rewritten from scratch, this patch (3/3) has just been added.
>
> Changes for v9:
> - add compile test for Kconfig,
> - fix include guard.
> ---
>  drivers/dma/Kconfig                        |  11 +
>  drivers/dma/Makefile                       |   1 +
>  drivers/dma/fsl-edma-common.c              |  24 +-
>  drivers/dma/mcf-edma.c                     | 315 +++++++++++++++++++++
>  include/linux/platform_data/dma-mcf-edma.h |  38 +++
>  5 files changed, 385 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/dma/mcf-edma.c
>  create mode 100644 include/linux/platform_data/dma-mcf-edma.h

Here and in other patches I already gave you my Tested-by tags...

Best regards,
Krzysztof
